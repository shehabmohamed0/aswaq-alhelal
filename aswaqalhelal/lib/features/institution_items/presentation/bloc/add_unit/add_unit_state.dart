part of 'add_unit_bloc.dart';

@freezed
class AddUnitState with _$AddUnitState {
  const factory AddUnitState({
    @Default('') String name,
    @Default(1) int quantity,
    @Default(0) double price,
    @Default([]) List<Unit> suggestions,
    @Default(true) bool enabled,
    @Default(AutoSuggestionState.emptyText) AutoSuggestionState suggestionState,
    @Default(None()) Option<Unit> selectedReferenceUnit,
    @Default(AddUnitStatus.initial) AddUnitStatus status,
    String? errorMessage,
    Unit? finalUnit,
  }) = _AddUnitState;
}

enum AddUnitStatus {
  initial,
  loading,
  loaded,
  failure,
  referenceUnitSelected,
  referenceUnitUnselected
}
