part of 'address_suggestions2_bloc.dart';

class AddressSuggestions2State<T extends RefAddress> extends Equatable {
  final String addressSearch;
  final List<T> suggestions;
  final AutoSuggestionState suggestionState;
  final Option<T> addressOrNull;
  final AddressSuggestionsStatus status;
  final bool enabled;
  final String? errorMessage;

  const AddressSuggestions2State({
    this.addressSearch = '',
    required this.suggestions,
    this.suggestionState = AutoSuggestionState.emptyText,
    required this.addressOrNull,
    this.status = AddressSuggestionsStatus.initial,
    this.enabled = false,
    this.errorMessage,
  });

  AddressSuggestions2State<T> copyWith({
    String? addressSearch,
    List<T>? suggestions,
    AutoSuggestionState? suggestionState,
    Option<T>? addressOrNull,
    AddressSuggestionsStatus? status,
    bool? enabled,
    String? errorMessage,
  }) =>
      AddressSuggestions2State(
          addressSearch: addressSearch ?? this.addressSearch,
          suggestions: suggestions ?? this.suggestions,
          suggestionState: suggestionState ?? this.suggestionState,
          addressOrNull: addressOrNull ?? this.addressOrNull,
          status: status ?? this.status,
          enabled: enabled ?? this.enabled,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object?> get props => [
        addressSearch,
        suggestions,
        suggestionState,
        addressOrNull,
        status,
        enabled,
        errorMessage
      ];
}

enum AddressSuggestionsStatus {
  initial,
  initEdit,
  addressSelected,
  addressUnSelected,
  loading,
  addingAddressSucess,
  failure
}
