import 'package:aswaqalhelal/features/auth/domain/entities/user_profile.dart';
import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';
import 'package:aswaqalhelal/features/orders/domain/repositories/user_orders_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/request_state.dart';
import '../../../../auth/domain/entities/institution_profile.dart';
import '../../../../institution_items/domain/entities/unit.dart';
import '../../../../orders/domain/entities/order_item.dart';
import '../../../../orders/domain/usecases/place_order.dart';
import '../../../domain/usecases/get_client_institution_item.dart';

part 'client_institutions_state.dart';

@injectable
class ClientInstitutionsCubit extends Cubit<ClientInstitutionsState> {
  ClientInstitutionsCubit(this._getClientInstitutionItems, this._placeOrder)
      : super(const ClientInstitutionsState());
  final GetClientInstitutionItems _getClientInstitutionItems;
  final PlaceOrder _placeOrder;
  Future<void> getItems(InstitutionProfile institution) async {
    emit(state.copyWith(ordersItemsState: RequestState.loading));
    final either = await _getClientInstitutionItems(
        params: GetClientInstitutionItemsParams(institution));
    either.fold(
      (l) => emit(state.copyWith(ordersItemsState: RequestState.error)),
      (items) {
        final ordersItems = items
            .map((item) => OrderItem(
                item: item,
                unit: item.units.first,
                quantity: 0,
                price: item.units.first.price))
            .toList();
        emit(state.copyWith(
            ordersItems: ordersItems, ordersItemsState: RequestState.loaded));
      },
    );
  }

  Future<void> placeOrder(
    InstitutionProfile institution,
    UserProfile user,
  ) async {
    if (state.placeOrderState.isLoading) return;
    emit(state.copyWith(placeOrderState: RequestState.loading));
    final cartItems = state.cartItems;
    final either = await _placeOrder(
        params: PlaceOrderParams(
            from: institution.id,
            institutionOwnerId: institution.userId,
            to: user.id,
            orderItems:
                state.cartItems.keys.map((key) => cartItems[key]!).toList(),
            orderState: OrderState.pending,
            totalPrice: state.totalPrice,
            editorId: user.id,
            name: user.name,
            phoneNumber: user.phoneNumber,
            sellerId: null));

    either.fold((failure) {
      emit(state.copyWith(
          placeOrderState: RequestState.error,
          errorMessage: (failure as ServerFailure).message));
    }, (order) {
      emit(state.copyWith(placeOrderState: RequestState.loaded));
    });
  }

  void update(OrderItem orderItem, int newQuantity) {
    final newOrderItem = orderItem.copyWith(quantity: newQuantity);
    final newCartItems = Map.of(state.cartItems);
    final List<OrderItem> newOrderItems = [];
    late OrderItem currentItem;
    bool isNew = true;
    for (int i = 0; i < state.ordersItems.length; i++) {
      currentItem = state.ordersItems[i];
      if (_sameCartItem(newOrderItem, currentItem)) {
        newOrderItems.add(newOrderItem);
        isNew = false;
      } else {
        newOrderItems.add(currentItem);
      }
    }

    if (isNew) {
      newOrderItems.add(newOrderItem);
    }
    newOrderItem.quantity == 0
        ? newCartItems.remove(_getKey(newOrderItem))
        : newCartItems[_getKey(newOrderItem)] = newOrderItem;
    final totalPrice = _getTotalPrice(newCartItems);

    emit(state.copyWith(
        ordersItems: newOrderItems,
        cartItems: newCartItems,
        totalPrice: totalPrice));
  }

  void add(OrderItem orderItem, [int addedQuantity = 1]) {
    List<OrderItem> newOrderItems = [];
    Map<String, OrderItem> newCartItems = Map.of(state.cartItems);
    final newOrderItem =
        orderItem.copyWith(quantity: orderItem.quantity + addedQuantity);
    late OrderItem currentItem;
    for (int i = 0; i < state.ordersItems.length; i++) {
      currentItem = state.ordersItems[i];
      _sameCartItem(currentItem, orderItem)
          ? newOrderItems.add(newOrderItem)
          : newOrderItems.add(currentItem);
    }
    newCartItems[_getKey(orderItem)] = newOrderItem;

    final totalPrice = _getTotalPrice(newCartItems);

    emit(state.copyWith(
        ordersItems: newOrderItems,
        cartItems: newCartItems,
        totalPrice: totalPrice));
  }

  String _getKey(OrderItem orderItem) =>
      orderItem.item.id + orderItem.unit.referenceId;

  double _getTotalPrice(Map<String, OrderItem> newCartItems) {
    final cartItems = newCartItems.values;
    if (cartItems.isEmpty) return 0;
    return cartItems
        .map((e) => e.unit.price * e.quantity)
        .reduce((value, element) => value + element);
  }

  bool _sameCartItem(OrderItem currentItem, OrderItem orderItem) {
    return currentItem.item.id == orderItem.item.id &&
        currentItem.unit.referenceId == orderItem.unit.referenceId;
  }

  void reduce(OrderItem orderItem, [int removedQuantity = 1]) {
    final newOrderItem =
        orderItem.copyWith(quantity: orderItem.quantity - removedQuantity);

    final newCartItems = Map.of(state.cartItems);
    List<OrderItem> newOrderItems = [];
    late OrderItem currentItem;

    for (int i = 0; i < state.ordersItems.length; i++) {
      currentItem = state.ordersItems[i];
      if (_sameCartItem(currentItem, newOrderItem)) {
        newOrderItems.add(newOrderItem);
      } else {
        newOrderItems.add(currentItem);
      }
    }
    newOrderItem.quantity == 0
        ? newCartItems.remove(_getKey(newOrderItem))
        : newCartItems[_getKey(newOrderItem)] = newOrderItem;

    final totalPrice = _getTotalPrice(newCartItems);
    emit(state.copyWith(
      cartItems: newCartItems,
      ordersItems: newOrderItems,
      totalPrice: totalPrice,
    ));
  }

  void changeItemUnit(OrderItem orderItem, Unit selectedUnit) {
    if (selectedUnit.referenceId == orderItem.unit.referenceId) return;

    final quantity = state
            .cartItems[orderItem.item.id + selectedUnit.referenceId]
            ?.quantity ??
        0;

    final newOrderItem =
        orderItem.copyWith(unit: selectedUnit, quantity: quantity);

    final List<OrderItem> newOrderItems = [];
    late OrderItem currentItem;
    for (int i = 0; i < state.ordersItems.length; i++) {
      currentItem = state.ordersItems[i];
      if (currentItem.item.id == newOrderItem.item.id) {
        newOrderItems.add(newOrderItem);
      } else {
        newOrderItems.add(currentItem);
      }
    }

    emit(state.copyWith(ordersItems: newOrderItems));
  }
}
