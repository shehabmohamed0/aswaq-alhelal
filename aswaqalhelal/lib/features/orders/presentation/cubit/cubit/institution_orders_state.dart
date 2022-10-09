part of 'institution_orders_cubit.dart';

@freezed
class InstitutionOrdersState with _$InstitutionOrdersState {
  const factory InstitutionOrdersState({
    @Default([]) List<Order> pendingOrders,
    @Default(RequestState.initial) RequestState pendingOrdersState,
    @Default([]) List<Order> processingOrders,
    @Default(RequestState.initial) RequestState processingOrdersState,
    @Default(RequestState.initial) RequestState updateState,
    @Default('Error') String errorMessage,
  }) = _InstitutionOrdersState;
}
