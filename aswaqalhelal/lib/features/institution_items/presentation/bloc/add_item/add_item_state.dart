part of 'add_item_bloc.dart';

@immutable
class AddItemState extends Equatable {
  final RequiredString itemName;
  final List<ReferenceItem> suggestions;
  final AutoSuggestionState suggestionState;
  final RequiredObject<ReferenceItem> selectedItem;
  final bool itemFromReference;
  final bool addingNewItem;
  final RequiredObject<File> imageFile;
  final RequiredObject<String> imageUrl;
  final AddItemStatus status;
  final String? errorMessage;
  final InstitutionItem? institutionItem;
  final InstitutionItem? oldItem;
  final bool isEdit;

  const AddItemState({
    this.selectedItem = const RequiredObject<ReferenceItem>.pure(),
    this.itemFromReference = false,
    this.addingNewItem = false,
    this.imageFile = const RequiredObject.pure(),
    this.imageUrl = const RequiredObject.pure(),
    this.itemName = const RequiredString.pure(),
    this.suggestionState = AutoSuggestionState.emptyText,
    this.suggestions = const [],
    this.status = AddItemStatus.initial,
    this.errorMessage,
    this.institutionItem,
    this.isEdit = false,
    this.oldItem,
  });

  AddItemState copyWith({
    RequiredObject<ReferenceItem>? selectedItem,
    RequiredObject<File>? imageFile,
    RequiredObject<String>? imageUrl,
    AutoSuggestionState? suggestionState,
    List<ReferenceItem>? suggestions,
    RequiredString? itemName,
    bool? itemFromReference,
    bool? addingNewItem,
    AddItemStatus? status,
    String? errorMessage,
    InstitutionItem? institutionItem,
    InstitutionItem? oldItem,
  }) {
    return AddItemState(
      selectedItem: selectedItem ?? this.selectedItem,
      itemName: itemName ?? this.itemName,
      addingNewItem: addingNewItem ?? this.addingNewItem,
      suggestionState: suggestionState ?? this.suggestionState,
      suggestions: suggestions ?? this.suggestions,
      itemFromReference: itemFromReference ?? this.itemFromReference,
      errorMessage: errorMessage ?? this.errorMessage,
      institutionItem: institutionItem ?? this.institutionItem,
      isEdit: isEdit,
      status: status ?? this.status,
      imageFile: imageFile ?? this.imageFile,
      imageUrl: imageUrl ?? this.imageUrl,
      oldItem: oldItem ?? this.oldItem,
    );
  }

  @override
  List<Object?> get props => [
        itemFromReference,
        suggestions,
        suggestionState,
        selectedItem,
        itemName,
        status,
        errorMessage,
        institutionItem,
        isEdit,
        imageFile,
        imageUrl,
        oldItem,
        addingNewItem
      ];
}

enum AddItemStatus { initial, loading, success, failed, reset }
