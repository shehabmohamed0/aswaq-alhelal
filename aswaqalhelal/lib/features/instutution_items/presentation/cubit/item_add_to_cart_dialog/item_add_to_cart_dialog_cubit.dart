import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../domain/entities/unit.dart';

part 'item_add_to_cart_dialog_cubit.freezed.dart';
part 'item_add_to_cart_dialog_state.dart';

@injectable
class ItemAddToCartDialogCubit extends Cubit<ItemAddToCartDialogState> {
  ItemAddToCartDialogCubit() : super(ItemAddToCartDialogState());

  void addItem() {
    final newQuantity = state.quantity + 1;
    emit(
      state.copyWith(
          quantity: newQuantity,
          totalPrice: newQuantity * (state.selectedUnit?.price ?? 1)),
    );
  }

  void removeItem() {
    final newQuantity = state.quantity - 1;
    emit(
      state.copyWith(
          quantity: newQuantity,
          totalPrice: newQuantity * (state.selectedUnit?.price ?? 1)),
    );
  }

  void changeUnit(Unit unit) {
    emit(
      state.copyWith(
        selectedUnit: unit,
        totalPrice: unit.price * state.quantity,
      ),
    );
  }

  void submit() {
    if (state.totalPrice != 0) {
      emit(state.copyWith(cartSubmitted: true));
    }
  }
}
