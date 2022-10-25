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
  final List<Option<Unit>> measureUnits;
  final FormzStatus status;
  final UnitStatus unitStatus;
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
    this.measureUnits = const [None()],
    this.suggestionState = AutoSuggestionState.emptyText,
    this.suggestions = const [],
    this.status = FormzStatus.pure,
    this.unitStatus = UnitStatus.initial,
    this.errorMessage,
    this.institutionItem,
    this.isEdit = false,
    this.oldItem,
  });

  AddItemState copyWith({
    RequiredObject<ReferenceItem>? selectedItem,
    List<Option<Unit>>? measureUnits,
    RequiredObject<File>? imageFile,
    RequiredObject<String>? imageUrl,
    AutoSuggestionState? suggestionState,
    List<ReferenceItem>? suggestions,
    RequiredString? itemName,
    bool? itemFromReference,
    bool? addingNewItem,
    FormzStatus? status,
    UnitStatus? unitStatus,
    String? errorMessage,
    InstitutionItem? institutionItem,
    InstitutionItem? oldItem,
  }) {
    return AddItemState(
      selectedItem: selectedItem ?? this.selectedItem,
      itemName: itemName ?? this.itemName,
      addingNewItem: addingNewItem ?? this.addingNewItem,
      measureUnits: measureUnits ?? this.measureUnits,
      suggestionState: suggestionState ?? this.suggestionState,
      suggestions: suggestions ?? this.suggestions,
      itemFromReference: itemFromReference ?? this.itemFromReference,
      status: status ?? this.status,
      unitStatus: unitStatus ?? this.unitStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      institutionItem: institutionItem ?? this.institutionItem,
      isEdit: isEdit,
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
        measureUnits,
        status,
        unitStatus,
        errorMessage,
        institutionItem,
        isEdit,
        imageFile,
        imageUrl,
        oldItem,
        addingNewItem
      ];
}

enum UnitStatus { initial, exsists }
