part of 'client_institution_cubit.dart';

class ClientInstitutionState extends Equatable {
  const ClientInstitutionState({
    this.ordersItems = const [],
    this.cartItems = const {},
    this.ordersItemsState = RequestState.initial,
    this.totalPrice = 0,
    this.placeOrderState = RequestState.initial,
    this.errorMessage,
  });
  final List<OrderItem> ordersItems;
  final RequestState ordersItemsState;
  final Map<String, OrderItem> cartItems;
  final double totalPrice;
  final RequestState placeOrderState;
  final String? errorMessage;

  ClientInstitutionState copyWith({
    List<OrderItem>? ordersItems,
    RequestState? ordersItemsState,
    Map<String, OrderItem>? cartItems,
    double? totalPrice,
    RequestState? placeOrderState,
    String? errorMessage,
  }) {
    return ClientInstitutionState(
      ordersItems: ordersItems ?? this.ordersItems,
      ordersItemsState: ordersItemsState ?? this.ordersItemsState,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      errorMessage: errorMessage ?? this.errorMessage,
      placeOrderState: placeOrderState ?? this.placeOrderState,
    );
  }

  @override
  List<Object?> get props => [
        ordersItems,
        ordersItemsState,
        cartItems,
        totalPrice,
        placeOrderState,
        errorMessage
      ];
}
