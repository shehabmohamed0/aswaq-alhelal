part of 'institution_receipts_cubit.dart';

enum InstitutionReceiptStatus {
  initial,
  itemSelected,
  itemUnselected,
  unitSelected,
  unitUnselected,
  invalidItem,
  invalidUnit,
  invalidPrice,
  invalidQuantity,
  receiptItemAdded,
  loading,
  success,
  failure
}

@freezed
class InstitutionReceiptsState with _$InstitutionReceiptsState {
  const factory InstitutionReceiptsState({
    @Default([]) List<InstitutionItem> items,
    @Default([]) List<InstitutionItem> filteredItems,
    @Default(RequestState.loading) RequestState itemsState,
    @Default(None()) Option<InstitutionItem> selectedItem,
    @Default(None()) Option<Unit> selectedUnit,
    @Default(0) double unitPrice,
    @Default(1) int quantity,
    @Default(0) double totalPrice,
    @Default(InstitutionReceiptStatus.initial) InstitutionReceiptStatus status,
    @Default(false) receiptSaved,
    @Default([]) List<ReceiptItem> receiptItems,
    String? errorMessage,
  }) = _InstitutionReceiptsState;
}
