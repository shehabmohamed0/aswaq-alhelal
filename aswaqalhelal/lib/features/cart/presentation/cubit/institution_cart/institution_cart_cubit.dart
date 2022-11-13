import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../orders/domain/entities/order_item.dart';

part 'institution_cart_cubit.freezed.dart';
part 'institution_cart_state.dart';

@injectable
class InstitutionCartCubit extends Cubit<InstitutionCartState> {
  InstitutionCartCubit() : super(InstitutionCartState());

  void addCartItem(OrderItem cartItem) {
    final index = state.cartItems.indexWhere(
      (element) => element.item.id == cartItem.item.id,
    );

    if (index == -1) {
      emit(
        state.copyWith(
            cartItems: List.of(state.cartItems)..add(cartItem),
            totalPrice:
                state.totalPrice + (cartItem.quantity * cartItem.unit.price)),
      );
    } else {
      double totalPrice = 0;
      final newList = List.of(
        state.cartItems.map(
          (e) {
            if (e.item.id == cartItem.item.id) {
              final newQuantity = e.quantity + cartItem.quantity;
              totalPrice += newQuantity * e.unit.price;
              return OrderItem(
                  item: e.item,
                  unit: e.unit,
                  quantity: newQuantity,
                  price: e.unit.price);
            }
            totalPrice += e.unit.price * e.quantity;
            return e;
          },
        ),
      );
      emit(
        state.copyWith(cartItems: newList, totalPrice: totalPrice),
      );
    }
  }

  void add(OrderItem orderItem) {
    final newList = List.of(state.cartItems.map((element) {
      if (element.item.id == orderItem.item.id) {
        return orderItem.copyWith(quantity: orderItem.quantity + 1);
      }
      return element;
    }));
    emit(state.copyWith(
        cartItems: newList,
        totalPrice: state.totalPrice + orderItem.unit.price));
  }

  void reduce(OrderItem cartItem) {
    final newQuantity = cartItem.quantity - 1;
    late List<OrderItem> newList;
    if (newQuantity == 0) {
      final index = state.cartItems
          .indexWhere((element) => element.item.id == cartItem.item.id);
      newList = List.of(state.cartItems..removeAt(index));
    } else {
      newList = List.of(state.cartItems.map((element) {
        if (element.item.id == cartItem.item.id) {
          return cartItem.copyWith(quantity: newQuantity);
        }
        return element;
      }));
    }

    emit(state.copyWith(
        cartItems: newList,
        totalPrice: state.totalPrice - cartItem.unit.price));
  }

  void remove(OrderItem orderItem) {
    final newList = List.of(state.cartItems
        .where((element) => element.item.id != orderItem.item.id));

    emit(state.copyWith(
        cartItems: newList,
        totalPrice:
            state.totalPrice - (orderItem.unit.price * orderItem.quantity)));
  }
}
