import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/request_state.dart';
import '../../../../auth/domain/entities/institution_profile.dart';
import '../../../../orders/domain/entities/order_item.dart';
import '../../../domain/usecases/get_client_institution_item.dart';

part 'client_institutions_state.dart';

@injectable
class ClientInstitutionsCubit extends Cubit<ClientInstitutionsState> {
  ClientInstitutionsCubit(this._getClientInstitutionItems)
      : super(const ClientInstitutionsState());
  final GetClientInstitutionItems _getClientInstitutionItems;
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

  void add(OrderItem orderItem) {
    List<OrderItem> newOrderItems = [];
    Map<String, OrderItem> newCartItems = Map.of(state.cartItems);
    final newOrderItem = orderItem.copyWith(quantity: orderItem.quantity + 1);
    log('new quantity ${newOrderItem.quantity}');
    late OrderItem currentItem;
    for (int i = 0; i < state.ordersItems.length; i++) {
      currentItem = state.ordersItems[i];
      if (currentItem.item.id == orderItem.item.id &&
          currentItem.unit.referenceId == orderItem.unit.referenceId) {
        newOrderItems.add(newOrderItem);
      } else {
        newOrderItems.add(currentItem);
      }
      newCartItems[orderItem.item.id + orderItem.unit.referenceId] =
          newOrderItem;
    }

    // final newList = List.of(state.cartItems.map((element) {
    //   if (element.item.id == orderItem.item.id &&
    //       element.unit.referenceId == orderItem.unit.referenceId) {
    //     return orderItem.copyWith(quantity: orderItem.quantity + 1);
    //   }
    //   return element;
    // }));
    emit(state.copyWith(
        ordersItems: newOrderItems,
        cartItems: newCartItems,
        totalPrice: state.totalPrice + orderItem.unit.price));
  }

  void reduce(OrderItem orderItem) {
    final newOrderItem = orderItem.copyWith(quantity: orderItem.quantity - 1);
    log('new quantity is ${newOrderItem.quantity}');

    final newCartItems = Map.of(state.cartItems);
    List<OrderItem> newOrderItems = [];
    late OrderItem currentItem;

    for (int i = 0; i < state.ordersItems.length; i++) {
      currentItem = state.ordersItems[i];
      if (currentItem.item.id == orderItem.item.id &&
          currentItem.unit.referenceId == orderItem.unit.referenceId) {
        newOrderItems.add(newOrderItem);
        if (newOrderItem.quantity == 0) {
          log('You removed it');
          log('before ${newCartItems.entries.length}');
          final s = newCartItems
              .remove(newOrderItem.item.id + newOrderItem.unit.referenceId);
          log('after ${newCartItems.entries.length}');
          if (s == null) {
            log('not in the map');
          }
        }
      } else {
        log('You added');
        newOrderItems.add(currentItem);
        // newCartItems[currentItem.item.id + currentItem.unit.referenceId] =
        //     newOrderItem;
      }
    }
    log('newCartItems.length after deleting is ${newCartItems.length}');
    emit(state.copyWith(
      cartItems: newCartItems,
      ordersItems: newOrderItems,
      totalPrice: state.totalPrice - orderItem.unit.price,
    ));
  }

  void remove(OrderItem orderItem) {
    final newList = List.of(state.ordersItems.map((element) {
      if (element.item.id == orderItem.item.id) {
        return orderItem.copyWith(quantity: 0);
      }

      return element;
    }));
    final newCartItems = Map.of(state.cartItems);
    newCartItems.remove(orderItem.item.id + orderItem.unit.referenceId);
    emit(state.copyWith(
        ordersItems: newList,
        totalPrice:
            state.totalPrice - (orderItem.unit.price * orderItem.quantity)));
  }
}
