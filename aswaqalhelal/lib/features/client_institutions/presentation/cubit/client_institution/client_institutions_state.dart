part of 'client_institutions_cubit.dart';

class ClientInstitutionsState extends Equatable {
  const ClientInstitutionsState({
    this.ordersItems = const [],
    this.cartItems = const {},
    this.ordersItemsState = RequestState.initial,
    this.totalPrice = 0,
    this.errorMessage,
  });
  final List<OrderItem> ordersItems;
  final RequestState ordersItemsState;
  final Map<String, OrderItem> cartItems;
  final double totalPrice;
  final String? errorMessage;

  ClientInstitutionsState copyWith({
    List<OrderItem>? ordersItems,
    RequestState? ordersItemsState,
    Map<String, OrderItem>? cartItems,
    double? totalPrice,
    String? errorMessage,
  }) {
    return ClientInstitutionsState(
      ordersItems: ordersItems ?? this.ordersItems,
      ordersItemsState: ordersItemsState ?? this.ordersItemsState,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [ordersItems, ordersItemsState, cartItems, totalPrice, errorMessage];
}
