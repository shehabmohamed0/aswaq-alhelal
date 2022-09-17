import 'package:aswaqalhelal/core/params/institution_receipts/add_institution_receipts_params.dart';
import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart' hide Unit;

import '../../../../core/params/add_item/params.dart';
import '../../../../core/request_state.dart';
import '../../../institution_items/domain/entities/institution_item.dart';
import '../../../institution_items/domain/entities/unit.dart';
import '../../../institution_items/domain/usecases/get_institution_items.dart';
import '../../domain/entities/receipt_item.dart';
import '../../domain/usecases/add_institution_receipts.dart';
import '../../domain/usecases/get_institution_receipts.dart';

part 'institution_receipts_cubit.freezed.dart';
part 'institution_receipts_state.dart';

@injectable
class InstitutionReceiptsCubit extends Cubit<InstitutionReceiptsState> {
  InstitutionReceiptsCubit(
    this._getInstitutionItems,
    this._getInstitutionReceipts,
    this._addInstitutionReceipt,
  ) : super(const InstitutionReceiptsState());

  final GetInstitutionItems _getInstitutionItems;
  final GetInstitutionReceipts _getInstitutionReceipts;
  final AddInstitutionReceipt _addInstitutionReceipt;

  void getInstitutionItems(String institutionId) async {
    emit(state.copyWith(itemsState: RequestState.loading));
    final either = await _getInstitutionItems(
        params: GetInstitutionItemsParams(institutionId));

    either.fold(
      (failure) {
        emit(state.copyWith(itemsState: RequestState.error));
      },
      (items) {
        emit(state.copyWith(
            items: items,
            itemsState: RequestState.loaded,
            filteredItems: items));
      },
    );
  }

  void itemSelected(InstitutionItem item) {
    emit(state.copyWith(
      selectedItem: some(item),
      status: InstitutionReceiptStatus.itemSelected,
      selectedUnit: some(item.units.first),
      quantity: 1,
      unitPrice: item.units.first.price,
    ));
  }

  void itemUnselected() {
    emit(state.copyWith(
        selectedItem: none(),
        selectedUnit: none(),
        quantity: 0,
        unitPrice: 0,
        status: InstitutionReceiptStatus.itemUnselected));
  }

  void unitSelected(Unit unit) {
    emit(state.copyWith(
        selectedUnit: some(unit),
        unitPrice: unit.price,
        status: InstitutionReceiptStatus.unitSelected));
  }

  void unitUnselected() {
    emit(state.copyWith(
        selectedUnit: none(),
        quantity: 0,
        unitPrice: 0,
        status: InstitutionReceiptStatus.unitUnselected));
  }

  void searchItem(String itemName) {
    if (itemName.isEmpty) {
      emit(state.copyWith(filteredItems: state.items));
      return;
    }
    final items = state.items
        .where((item) =>
            item.name.toLowerCase().startsWith(itemName.toLowerCase()))
        .toList();

    emit(state.copyWith(filteredItems: items));
  }

  void unitPriceChanged(String unitPrice) {
    final price = double.tryParse(unitPrice);

    if (price != null) {
      emit(state.copyWith(unitPrice: price));
    } else {
      emit(state.copyWith(unitPrice: 0));
    }
  }

  void quantityChanged(String quantitySelected) {
    final quantity = int.tryParse(quantitySelected);

    if (quantity != null) {
      emit(state.copyWith(quantity: quantity));
    } else {
      emit(state.copyWith(quantity: 0));
    }
  }

  Future<void> submit() async {
    if (state.status == InstitutionReceiptStatus.loading) return;
    if (_inValidReceipt()) return;
    final receiptItem = ReceiptItem(
        item: state.selectedItem.toNullable()!,
        unit: state.selectedUnit.toNullable()!,
        quantity: state.quantity,
        price: state.unitPrice);
    final index = state.receiptItems.indexWhere((element) =>
        element.item.id == receiptItem.item.id &&
        element.unit == receiptItem.unit &&
        element.price == receiptItem.price);

    final newList = List.of(state.receiptItems);
    if (index != -1) {
      final newItem = ReceiptItem(
        item: state.selectedItem.toNullable()!,
        unit: state.selectedUnit.toNullable()!,
        quantity: receiptItem.quantity + state.receiptItems[index].quantity,
        price: receiptItem.price,
      );

      newList[index] = newItem;
    } else {
      newList.add(receiptItem);
    }
    emit(state.copyWith(
        receiptItems: newList,
        totalPrice: state.totalPrice + receiptItem.price * receiptItem.quantity,
        selectedItem: none(),
        selectedUnit: none(),
        unitPrice: 0,
        quantity: 0,
        status: InstitutionReceiptStatus.receiptItemAdded));
  }

  bool _inValidReceipt() {
    emit(state.copyWith(status: InstitutionReceiptStatus.initial));
    if (state.selectedItem.isNone()) {
      emit(state.copyWith(status: InstitutionReceiptStatus.invalidItem));
      return true;
    }

    if (state.selectedUnit.isNone()) {
      emit(state.copyWith(status: InstitutionReceiptStatus.invalidUnit));
      return true;
    }
    if (state.quantity == 0) {
      emit(state.copyWith(status: InstitutionReceiptStatus.invalidQuantity));
      return true;
    }
    if (state.unitPrice == 0) {
      emit(state.copyWith(status: InstitutionReceiptStatus.invalidPrice));
      return true;
    }
    return false;
  }

  void removeReceiptItem(int index) {
    final toRemove = state.receiptItems[index];
    emit(state.copyWith(
        receiptItems: List.of(state.receiptItems)..removeAt(index),
        totalPrice: state.totalPrice - (toRemove.price * toRemove.quantity)));
  }

  Future<void> saveReceipt(String institutionId) async {
    if (state.status == InstitutionReceiptStatus.loading) return;
    emit(state.copyWith(status: InstitutionReceiptStatus.loading));

    final either = await _addInstitutionReceipt(
      params: AddInstitutionReceiptParams(
        from: institutionId,
        receiptItems: state.receiptItems,
        to: null,
        totalPrice: state.totalPrice,
      ),
    );

    either.fold(
      (failure) => emit(state.copyWith(
          errorMessage: (failure as ServerFailure).message,
          status: InstitutionReceiptStatus.failure)),
      (receipt) => emit(
        state.copyWith(
          receiptSaved: true,
          status: InstitutionReceiptStatus.success,
        ),
      ),
    );
  }
}
