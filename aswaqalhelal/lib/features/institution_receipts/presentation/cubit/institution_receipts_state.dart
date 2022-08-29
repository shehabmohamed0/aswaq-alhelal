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
  success,
  failure,
  loading
}

@freezed
class InstitutionReceiptsState with _$InstitutionReceiptsState {
  const factory InstitutionReceiptsState.initial() = ReceiptsInitial;
  const factory InstitutionReceiptsState.loading() = ReceiptsLoading;
  const factory InstitutionReceiptsState.error() = ItemsError;
  const factory InstitutionReceiptsState.itemsLoaded({
    required List<InstitutionItem> items,
    @Default(RequiredObject.pure())
        RequiredObject<InstitutionItem> selectedItem,
    @Default(RequiredObject<Unit>.pure()) RequiredObject<Unit> selectedUnit,
    @Default(0) double unitPrice,
    @Default(1) int quantity,
    @Default(InstitutionReceiptStatus.initial) InstitutionReceiptStatus status,
    @Default([]) List<ReceiptItem> receiptItems,
    String? errorMessage,
  }) = ItemsLoaded;
}
