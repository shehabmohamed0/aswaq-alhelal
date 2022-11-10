part of 'add_item_bloc.dart';

@immutable
abstract class AddItemEvent {}

class AddItemSearch extends AddItemEvent {
  final String value;
  AddItemSearch(this.value);
}

class AddItemSelectedEvent extends AddItemEvent {
  final ReferenceItem item;
  AddItemSelectedEvent(this.item);
}

class AddNewItem extends AddItemEvent {
  final String itemName;
  AddNewItem(this.itemName);
}

class AddItemSubmit extends AddItemEvent {
  final String institutionId;
  final List<InstitutionItem> currentItems;
  final List<UnitEntryRow> units;
  final Unit baseUnit;
  AddItemSubmit({
    required this.institutionId,
    required this.currentItems,
    required this.units,
    required this.baseUnit,
  });
}

class RemoveSelectionPressed extends AddItemEvent {
  RemoveSelectionPressed();
}

class SelectImagePressed extends AddItemEvent {
  final ImageSource source;
  SelectImagePressed(this.source);
}

class InitEdit extends AddItemEvent {
  final InstitutionItem item;

  InitEdit(this.item);
}

class DeleteImageFile extends AddItemEvent {
  DeleteImageFile();
}

class DeleteImageUrl extends AddItemEvent {
  DeleteImageUrl();
}

class NewButtonClicked extends AddItemEvent {
  NewButtonClicked();
}
