part of 'institution_receipts_cubit.dart';

@freezed
class InstitutionReceiptsState with _$InstitutionReceiptsState {
  const factory InstitutionReceiptsState({
    @Default([]) List<InstitutionItem> items,
    @Default([]) List<InstitutionItem> filteredItems,
    @Default(None()) Option<InstitutionClient> client,
    @Default(RequestState.loading) RequestState itemsState,
    @Default(None()) Option<InstitutionItem> selectedItem,
    @Default(None()) Option<Unit> selectedUnit,
    @Default(0) double unitPrice,
    @Default(1) int quantity,
    @Default(0) double totalPrice,
    @Default(InstitutionReceiptStatus.initial) InstitutionReceiptStatus status,
    @Default(None()) Option<Order> savedOrder,
    @Default([]) List<OrderItem> receiptItems,
    String? errorMessage,
  }) = _InstitutionReceiptsState;
}

enum InstitutionReceiptStatus {
  initial,
  clientSelected,
  clientUnSelected,
  itemSelected,
  itemUnselected,
  unitSelected,
  unitUnselected,
  invalidItem,
  invalidUnit,
  invalidPrice,
  invalidQuantity,
  invalidClient,
  receiptItemAdded,
  loading,
  success,
  failure,
  reset,
}

const defaultPurchaseClient = SystemProfile(
  id: 'zN9HD2x9hgfaih9KaqBM',
  userId: 'zN9HD2x9hgfaih9KaqBM',
  arabicName: 'عميل نقدى',
  name: 'Purchase client',
);
