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

class AddUnitEvent extends AddItemEvent {
  final Unit unit;
  AddUnitEvent(this.unit);
}

class RemoveUnitEvent extends AddItemEvent {
  final int index;
  RemoveUnitEvent(this.index);
}

class UpdateUnitEvent extends AddItemEvent {
  final Unit unit;
  final int index;
  UpdateUnitEvent(this.unit, this.index);
}

class AddNewItem extends AddItemEvent {
  final String itemName;
  AddNewItem(this.itemName);
}

class AddItemSubmit extends AddItemEvent {
  final String institutionId;
  final List<InstitutionItem> currentItems;
  AddItemSubmit({required this.institutionId, required this.currentItems});
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

class UnitChanged extends AddItemEvent {
  final Unit? unit;
  final int index;
  UnitChanged(this.unit, this.index);
}

class UnitAddPressed extends AddItemEvent {
  UnitAddPressed();
}
