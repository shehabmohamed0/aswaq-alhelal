import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../domain/entities/cart_item.dart';

part 'institution_cart_cubit.freezed.dart';
part 'institution_cart_state.dart';

@injectable
class InstitutionCartCubit extends Cubit<InstitutionCartState> {
  InstitutionCartCubit() : super(InstitutionCartState());

  void addCartItem(CartItem cartItem) {
    final index = state.cartItems.indexWhere(
      (element) => element.item.id == cartItem.item.id,
    );

    if (index == -1) {
      emit(
        state.copyWith(
            cartItems: List.of(state.cartItems)..add(cartItem),
            totalPrice: state.totalPrice +
                (cartItem.quantity * cartItem.selectedUnit.price)),
      );
    } else {
      double totalPrice = 0;
      final newList = List.of(
        state.cartItems.map(
          (e) {
            if (e.item.id == cartItem.item.id) {
              final newQuantity = e.quantity + cartItem.quantity;
              totalPrice += newQuantity * e.selectedUnit.price;
              return CartItem(
                  id: '',
                  item: e.item,
                  selectedUnit: e.selectedUnit,
                  quantity: newQuantity);
            }
            totalPrice += e.selectedUnit.price * e.quantity;
            return e;
          },
        ),
      );
      emit(
        state.copyWith(cartItems: newList, totalPrice: totalPrice),
      );
    }
  }

  void add(CartItem cartItem) {
    final newList = List.of(state.cartItems.map((element) {
      if (element.item.id == cartItem.item.id) {
        return cartItem.copyWith(quantity: cartItem.quantity + 1);
      }
      return element;
    }));
    emit(state.copyWith(
        cartItems: newList,
        totalPrice: state.totalPrice + cartItem.selectedUnit.price));
  }

  void reduce(CartItem cartItem) {
    final newQuantity = cartItem.quantity - 1;
    late List<CartItem> newList;
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
        totalPrice: state.totalPrice - cartItem.selectedUnit.price));
  }

  void remove(CartItem cartItem) {
    final newList = List.of(state.cartItems
        .where((element) => element.item.id != cartItem.item.id));

    emit(state.copyWith(
        cartItems: newList,
        totalPrice: state.totalPrice -
            (cartItem.selectedUnit.price * cartItem.quantity)));
  }
}
