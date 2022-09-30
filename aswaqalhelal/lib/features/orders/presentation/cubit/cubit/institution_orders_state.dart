part of 'institution_orders_cubit.dart';

@freezed
class InstitutionOrdersState with _$InstitutionOrdersState {
  const factory InstitutionOrdersState({
    @Default([]) List<Order> pendingOrders,
    @Default(RequestState.initial) pendingOrdersState,
    @Default([]) List<Order> shippingOrders,
    @Default(RequestState.initial) shippingOrdersState,
  }) = _InstitutionOrdersState;
}
