import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/request_state.dart';
import '../../../domain/entities/order.dart';
import '../../../domain/repositories/institution_orders_repository.dart';
import '../../../domain/repositories/user_orders_repository.dart';
import '../../../domain/usecases/get_user_orders.dart';
import '../../../domain/usecases/update_institution_order.dart';
import 'user_orders_event.dart';

part 'user_orders_bloc.freezed.dart';
part 'user_orders_state.dart';

@injectable
class UserOrdersBloc extends Bloc<UserOrdersEvent, UserOrdersState> {
  final GetUserOrders _getUserOrders;
  final UpdateInstitutionOrder _updateInstitutionOrder;
  UserOrdersBloc(this._getUserOrders, this._updateInstitutionOrder)
      : super(const UserOrdersState()) {
    on<UserOrdersRequested>(_onUserOrdersRequested);
    on<OrderCanceled>(_onOrderCanceled);
  }

  FutureOr<void> _onUserOrdersRequested(event, emit) async {
    final either =
        await _getUserOrders(params: GetUserOrdersParams(id: event.id));

    await either.fold((failue) {
      return emit(state.copyWith(ordersState: RequestState.error));
    }, (stream) async {
      return emit.forEach<List<Order>>(
        stream,
        onData: (data) {
          return state.copyWith(orders: data, ordersState: RequestState.loaded);
        },
      );
    });
  }

  FutureOr<void> _onOrderCanceled(
      OrderCanceled event, Emitter<UserOrdersState> emit) async {
    if (!event.order.orderState.isPending) return;
    if (state.updateState.isLoading) return;

    emit(state.copyWith(updateState: RequestState.loading));

    final either = await _updateInstitutionOrder(
        params: UpdateInstitutionOrderParams(
            order: event.order, orderState: OrderState.canceled));

    either.fold(
      (failure) => emit(state.copyWith(
          updateState: RequestState.error,
          errorMessage: (failure as ServerFailure).message)),
      (updatedOrder) => emit(state.copyWith(updateState: RequestState.loaded)),
    );
  }
}
