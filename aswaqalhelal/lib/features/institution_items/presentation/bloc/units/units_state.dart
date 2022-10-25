part of 'units_bloc.dart';

@freezed
class UnitsState with _$UnitsState {
  const factory UnitsState({
    @Default([]) List<UnitEntryRow> units,
    @Default(UnitsStatus.initial) UnitsStatus status,
  }) = _UnitsState;
}

enum UnitsStatus {
  initial,
  loading,
  success,
  failure,
  unitSelected,
  unitUnselected,
  fromUnitChanged,
}
