part of 'institution_cart_cubit.dart';

@freezed
abstract class InstitutionCartState with _$InstitutionCartState {
  factory InstitutionCartState({
    @Default([]) List<OrderItem> cartItems,
    @Default(0) double totalPrice,
   }) = _InstitutionCartState;
}
