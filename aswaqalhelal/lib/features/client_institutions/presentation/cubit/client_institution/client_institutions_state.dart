part of 'client_institutions_cubit.dart';

class ClientInstitutionsState extends Equatable {
  const ClientInstitutionsState({
    this.items = const [],
    this.itemsState = RequestState.initial,
    this.errorMessage,
  });
  final List<InstitutionItem> items;
  final RequestState itemsState;
  final String? errorMessage;

  ClientInstitutionsState copyWith({
    List<InstitutionItem>? items,
    RequestState? itemsState,
    String? errorMessage,
  }) {
    return ClientInstitutionsState(
      items: items ?? this.items,
      itemsState: itemsState ?? this.itemsState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [items, itemsState, errorMessage];
}
