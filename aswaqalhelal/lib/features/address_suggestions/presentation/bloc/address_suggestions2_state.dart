part of 'address_suggestions2_bloc.dart';

@freezed
class AddressSuggestions2State<T extends RefAddress>
    with _$AddressSuggestions2State<T> {
  const factory AddressSuggestions2State({
    @Default('') String addressSearch,
    @Default([]) List<T> suggestions,
    @Default(AutoSuggestionState.emptyText) AutoSuggestionState suggestionState,
    @Default(None()) Option<T> addressOrNull,
    @Default(AddressSuggestionsStatus.initial) AddressSuggestionsStatus status,
    @Default(false) bool enabled,
    String? errorMessage,
  }) = _AddressSuggestionsState;
}

enum AddressSuggestionsStatus {
  initial,

  addressSelected,
  addressUnSelected,
  loading,
  addingAddressSucess,
  failure
}
