import 'dart:developer';

import 'package:aswaqalhelal/features/institution_receipts/domain/entities/receipt_item.dart';
import 'package:bloc/bloc.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/add_item/params.dart';
import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../instutution_items/domain/entities/cart_item.dart';
import '../../../instutution_items/domain/entities/institution_item.dart';
import '../../../instutution_items/domain/entities/unit.dart';
import '../../../instutution_items/domain/usecases/get_institution_items.dart';
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
  ) : super(const InstitutionReceiptsState.initial());

  final GetInstitutionItems _getInstitutionItems;
  final GetInstitutionReceipts _getInstitutionReceipts;
  final AddInstitutionReceipt _addInstitutionReceipt;

  void getInstitutionItems(String institutionId) async {
    emit(const InstitutionReceiptsState.loading());
    final either = await _getInstitutionItems(
        params: GetInstitutionItemsParams(institutionId));

    either.fold(
      (failure) {
        emit(const InstitutionReceiptsState.error());
      },
      (items) {
        emit(InstitutionReceiptsState.itemsLoaded(items: items));
      },
    );
  }

  void itemSelected(InstitutionItem item) {
    state.mapOrNull(
      itemsLoaded: (state) => emit(state.copyWith(
          selectedItem: RequiredObject.dirty(item),
          status: InstitutionReceiptStatus.itemSelected)),
    );
  }

  void itemUnselected() {
    state.mapOrNull(itemsLoaded: (state) {
      emit(state.copyWith(
          selectedItem: const RequiredObject.pure(),
          selectedUnit: const RequiredObject.pure(),
          quantity: 0,
          unitPrice: 0,
          status: InstitutionReceiptStatus.itemUnselected));
    });
  }

  void unitSelected(Unit unit) {
    state.mapOrNull(
      itemsLoaded: (state) => emit(state.copyWith(
          selectedUnit: RequiredObject.dirty(unit),
          unitPrice: unit.price,
          status: InstitutionReceiptStatus.unitSelected)),
    );
  }

  void unitUnselected() {
    state.mapOrNull(itemsLoaded: (state) {
      emit(state.copyWith(
          selectedUnit: const RequiredObject.pure(),
          quantity: 0,
          unitPrice: 0,
          status: InstitutionReceiptStatus.unitUnselected));
    });
  }

  void unitPriceChanged(String unitPrice) {
    final price = double.tryParse(unitPrice);

    if (price != null) {
      state.mapOrNull(
        itemsLoaded: (state) => emit(state.copyWith(unitPrice: price)),
      );
    } else {
      state.mapOrNull(
        itemsLoaded: (state) => emit(state.copyWith(unitPrice: 0)),
      );
    }
  }

  void quantityChanged(String quantitySelected) {
    final quantity = int.tryParse(quantitySelected);

    if (quantity != null) {
      state.mapOrNull(
        itemsLoaded: (state) => emit(state.copyWith(quantity: quantity)),
      );
    } else {
      state.mapOrNull(
        itemsLoaded: (state) => emit(state.copyWith(quantity: 0)),
      );
    }
  }

  Future<void> submit() async {
    state.mapOrNull(
      itemsLoaded: (state) {
        if (state.status == InstitutionReceiptStatus.loading) return;
        if (_inValidReceipt(state)) return;
        final receiptItem = ReceiptItem(
            item: state.selectedItem.value!,
            selectedUnit: state.selectedUnit.value!,
            quantity: state.quantity,
            selectedPrice: state.unitPrice);

        emit(state.copyWith(
            receiptItems: List.of(state.receiptItems)..add(receiptItem)));
      },
    );
  }

  bool _inValidReceipt(ItemsLoaded state) {
    emit(state.copyWith(status: InstitutionReceiptStatus.initial));
    if (state.selectedItem.value == null) {
      emit(state.copyWith(status: InstitutionReceiptStatus.invalidItem));
      return true;
    }

    if (state.selectedUnit.value == null) {
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
    state.mapOrNull(
      itemsLoaded: (state) {
        emit(state.copyWith(
            receiptItems: List.of(state.receiptItems)..removeAt(index)));
      },
    );
  }
}
 // emit(state.copyWith(status: InstitutionReceiptStatus.loading));

        // final either =
        //     await _addInstitutionReceipt(params: AddInstitutionReceiptParams());

        // either.fold(
        //     (failure) =>
        //         emit(state.copyWith(status: InstitutionReceiptStatus.failure)),
        //     (receipt) =>
        //         emit(state.copyWith(status: InstitutionReceiptStatus.success)));