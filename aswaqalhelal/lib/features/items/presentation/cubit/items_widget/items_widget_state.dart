part of 'items_widget_cubit.dart';

@freezed
class ItemsWidgetState with _$ItemsWidgetState {
  const factory ItemsWidgetState({
    @Default([]) List<InstitutionItem> items,
    @Default([]) List<InstitutionItem> searchItems,
    @Default(SortType.creationTime) SortType sortType,
    @Default(SortDirection.descending) SortDirection sortDirection,
    @Default(DisplayItems.gridView) DisplayItems displayItem,
    @Default(false) bool isSearching,
    @Default('') String searchValue,
  }) = _ItemsWidgetState;
}

enum SortType { alphabetically, creationTime }
enum SortDirection { ascending, descending }
enum DisplayItems { gridView, listView }

extension SortDirectionExtension on SortDirection {
  
  bool get isAscending => this == SortDirection.ascending;
  bool get isDescending => this == SortDirection.descending;
}

extension DisplayItemsExtension on DisplayItems {
  bool get isGridView => this == DisplayItems.gridView;
  bool get isListView => this == DisplayItems.listView;
}
