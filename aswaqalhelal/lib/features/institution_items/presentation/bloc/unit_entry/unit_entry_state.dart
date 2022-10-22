part of 'unit_entry_bloc.dart';

@freezed
class UnitEntryState with _$UnitEntryState {
  const factory UnitEntryState(
      {@Default(Name.pure())
          Name name,
      @Default([])
          List<Unit> unitSuggestions,
      @Default(AutoSuggestionState.emptyText)
          AutoSuggestionState sugggestionStatus,
      @Default(RequiredObject.pure())
          RequiredObject<Unit> unit,
      @Default(RequiredObject.pure())
          RequiredObject<Unit> fromUnit,
      @Default(Number.pure(
        acceptNegative: false,
        acceptZero: false,
        isFractional: true,
      ))
          Number quantity,
      @Default(Number.pure(
        acceptNegative: false,
        isFractional: true,
      ))
          Number price,
      @Default(UnitEntryStatus.initial)
          UnitEntryStatus status,
      @Default('')
          String errorMessage}) = _UnitEntryState;
}

enum UnitEntryStatus {
  initial,
  loading,
  success,
  failure,
  unitSelected,
  unitUnselected,
  fromUnitChanged,
}
