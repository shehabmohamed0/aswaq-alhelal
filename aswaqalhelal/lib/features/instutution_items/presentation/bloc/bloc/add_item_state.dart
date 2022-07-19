part of 'add_item_bloc.dart';

@immutable
class AddItemState extends Equatable {
  final ReferenceItem? item;
  final RequiredString itemName;
  final File? imageFile;
  final bool isNewItem;
  final List<Unit> units;
  final List<ReferenceItem> suggestions;
  final AutoSuggestionState suggestionState;
  final FormzStatus status;
  final String? errorMessage;
  final InstitutionItem? institutionItem;
  const AddItemState({
    this.item,
    this.isNewItem = true,
    this.imageFile,
    this.itemName = const RequiredString.pure(),
    this.units = const [],
    this.suggestionState = AutoSuggestionState.emptyText,
    this.suggestions = const [],
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.institutionItem,
  });

  AddItemState copyWith({
    ReferenceItem? item,
    List<Unit>? units,
    AutoSuggestionState? suggestionState,
    List<ReferenceItem>? suggestions,
    RequiredString? itemName,
    bool? isNewItem,
    FormzStatus? status,
    String? errorMessage,
    InstitutionItem? institutionItem,
  }) {
    return AddItemState(
      item: item ?? this.item,
      itemName: itemName ?? this.itemName,
      units: units ?? this.units,
      suggestionState: suggestionState ?? this.suggestionState,
      suggestions: suggestions ?? this.suggestions,
      isNewItem: isNewItem ?? this.isNewItem,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      institutionItem: institutionItem ?? this.institutionItem,
    );
  }

  @override
  List<Object?> get props => [
        isNewItem,
        suggestions,
        suggestionState,
        item,
        itemName,
        units,
        status,
        errorMessage,
        institutionItem
      ];
}
