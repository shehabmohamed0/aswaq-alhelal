part of 'user_orders_bloc.dart';

@freezed
class UserOrdersState with _$UserOrdersState {
  const factory UserOrdersState({
    @Default([]) List<Order> orders,
    @Default(RequestState.initial) RequestState ordersState,
    @Default(RequestState.initial) RequestState updateState,
    @Default('') String  errorMessage,
  }) = _UserOrdersState;
}
