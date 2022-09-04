part of 'add_unit_bloc.dart';

@immutable
abstract class AddUnitEvent {}

class SearchName extends AddUnitEvent {
  final String name;

  SearchName(this.name);
}

class UnitNameChanged extends AddUnitEvent {
  final String name;

  UnitNameChanged(this.name);
}

class UnitQuantityChanged extends AddUnitEvent {
  final String quantity;

  UnitQuantityChanged(this.quantity);
}

class UnitPriceChanged extends AddUnitEvent {
  final String price;

  UnitPriceChanged(this.price);
}

class UnitSelected extends AddUnitEvent {
  final Unit unit;

  UnitSelected(this.unit);
}

class UnitUnSelected extends AddUnitEvent {
  UnitUnSelected();
}

class FormSubmitted extends AddUnitEvent {}
