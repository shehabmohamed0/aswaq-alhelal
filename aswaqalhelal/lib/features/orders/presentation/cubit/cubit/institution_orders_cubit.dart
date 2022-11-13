import 'package:bloc/bloc.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/failures/orders/update_order_failure.dart';
import '../../../../../core/request_state.dart';
import '../../../domain/entities/order.dart';
import '../../../domain/repositories/institution_orders_repository.dart';
import '../../../domain/usecases/get_institution_orders.dart';
import '../../../domain/usecases/update_institution_order.dart';

part 'institution_orders_cubit.freezed.dart';
part 'institution_orders_state.dart';

@injectable
class InstitutionOrdersCubit extends Cubit<InstitutionOrdersState> {
  InstitutionOrdersCubit(
      this._getInstitutionOrders, this._updateInstitutionOrder)
      : super(const InstitutionOrdersState());
  final GetInstitutionOrders _getInstitutionOrders;
  final UpdateInstitutionOrder _updateInstitutionOrder;

  Future<void> init(String institutionId) async {
    emit(state.copyWith(
        pendingOrdersState: RequestState.loading,
        processingOrdersState: RequestState.loading));

    final orderLists = await Future.wait([
      _getInstitutionOrders(
          params: GetInstitutionOrdersParams(
        institutionId: institutionId,
        whereIn: [OrderState.pending],
      )),
      _getInstitutionOrders(
          params: GetInstitutionOrdersParams(
        institutionId: institutionId,
        whereIn: [OrderState.shipping, OrderState.processing],
      ))
    ]);
    final eitherPendingOrfailure = orderLists[0];
    final eitherProcessingOrfailure = orderLists[1];
    eitherPendingOrfailure.fold(
        (failure) =>
            emit(state.copyWith(pendingOrdersState: RequestState.error)),
        (pendingOrders) => emit(state.copyWith(
            pendingOrdersState: RequestState.loaded,
            pendingOrders: pendingOrders)));

    eitherProcessingOrfailure.fold(
        (failure) =>
            emit(state.copyWith(processingOrdersState: RequestState.error)),
        (processing) {
      emit(state.copyWith(
        processingOrdersState: RequestState.loaded,
        processingOrders: processing,
      ));
    });
  }

  Future<void> acceptOrder(Order order) async {
    if (state.updateState.isLoading) return;
    emit(state.copyWith(updateState: RequestState.loading));
    final either = await _updateInstitutionOrder(
        params: UpdateInstitutionOrderParams(
            order: order, orderState: OrderState.processing));

    either.fold(
      (failure) {
        if (failure is UpdateOrderFailure) {
          final newList = List.of(state.pendingOrders.map((currentOrder) =>
              currentOrder.id == failure.newOrder.id
                  ? failure.newOrder
                  : currentOrder));
          emit(
            state.copyWith(
                updateState: RequestState.error,
                errorMessage: failure.message,
                pendingOrders: newList),
          );
        } else {
          emit(
            state.copyWith(
              updateState: RequestState.error,
              errorMessage: (failure as ServerFailure).message,
            ),
          );
        }
      },
      (updatedOrder) {
        int index = state.pendingOrders
            .indexWhere((element) => element.id == updatedOrder.id);
        final newPendingOrders = List.of(state.pendingOrders)..removeAt(index);
        final newProcessingOrders = List.of(state.processingOrders)
          ..add(updatedOrder);
        emit(state.copyWith(
          pendingOrders: newPendingOrders,
          updateState: RequestState.loaded,
          processingOrders: newProcessingOrders,
        ));
      },
    );
  }

  Future<void> moveToShipping(Order order) async {
    if (state.updateState.isLoading) return;
    emit(state.copyWith(updateState: RequestState.loading));
    final either = await _updateInstitutionOrder(
        params: UpdateInstitutionOrderParams(
            order: order, orderState: OrderState.shipping));

    either.fold(
      (failure) => emit(state.copyWith(
          updateState: RequestState.error,
          errorMessage: (failure as ServerFailure).message)),
      (updatedOrder) {
        final newProcessingOrders =
            List.of(state.processingOrders.map((currentOrder) {
          if (currentOrder.id == updatedOrder.id) return updatedOrder;
          return currentOrder;
        }));

        emit(state.copyWith(
          updateState: RequestState.loaded,
          processingOrders: newProcessingOrders,
        ));
      },
    );
  }

  Future<void> deline(Order order) async {
    if (state.updateState.isLoading) return;
    emit(state.copyWith(updateState: RequestState.loading));
    final either = await _updateInstitutionOrder(
        params: UpdateInstitutionOrderParams(
            order: order, orderState: OrderState.declined));

    either.fold(
      (failure) => emit(state.copyWith(
          updateState: RequestState.error,
          errorMessage: (failure as ServerFailure).message)),
      (updatedOrder) {
        final newPendingOrders =
            List.of(state.pendingOrders.map((currentOrder) {
          if (currentOrder.id == updatedOrder.id) return updatedOrder;
          return currentOrder;
        }));
        emit(state.copyWith(
          pendingOrders: newPendingOrders,
          updateState: RequestState.loaded,
        ));
      },
    );
  }
}
