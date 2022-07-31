part of 'item_add_to_cart_dialog_cubit.dart';

@freezed
abstract class ItemAddToCartDialogState with _$ItemAddToCartDialogState {
  factory ItemAddToCartDialogState({
    Unit? selectedUnit,
    @Default(0) double totalPrice,
    @Default(false) bool cartSubmitted,
    @Default(0) int quantity,
  }) = _ItemAddToCartDialogState;
}
