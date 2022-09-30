import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

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
        shippingOrdersState: RequestState.loading));

    final orderLists = await Future.wait([
      _getInstitutionOrders(
          params: GetInstitutionOrdersParams(
        institutionId: institutionId,
        whereIn: [OrderState.pending, OrderState.processing],
      )),
      _getInstitutionOrders(
          params: GetInstitutionOrdersParams(
        institutionId: institutionId,
        whereIn: [OrderState.shipping],
      ))
    ]);
    final eitherPendingOrfailure = orderLists[0];
    final eitherShippingOrfailure = orderLists[1];
    eitherPendingOrfailure.fold(
        (failure) =>
            emit(state.copyWith(pendingOrdersState: RequestState.error)),
        (pendingOrders) => emit(state.copyWith(
            pendingOrdersState: RequestState.loaded,
            pendingOrders: pendingOrders)));

    eitherShippingOrfailure.fold(
        (failure) =>
            emit(state.copyWith(shippingOrdersState: RequestState.error)),
        (shippingOrders) {
      emit(state.copyWith(
        shippingOrdersState: RequestState.loaded,
        shippingOrders: shippingOrders,
      ));
    });
  }






  
}
