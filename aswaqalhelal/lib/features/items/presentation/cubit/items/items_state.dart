part of 'items_cubit.dart';

enum SortType { alphabetically, creationTime }
enum SortDirection { ascending, descending }
enum DisplayItems { gridView, listView }

@freezed
class ItemsState with _$ItemsState {
  const factory ItemsState.initial() = Initial;
  const factory ItemsState.loading() = Loading;
  const factory ItemsState.error({
    required String message,
  }) = Error;
  const factory ItemsState.loaded({
    required List<InstitutionItem> items,
    @Default([]) List<InstitutionItem> searchItems,
    @Default(SortType.creationTime) SortType sortType,
    @Default(SortDirection.descending) SortDirection sortDirection,
    @Default(DisplayItems.gridView) DisplayItems displayItem,
    @Default(false) bool isSearching,
    @Default('') String searchValue,

  }) = Loaded;
}

extension SortDirectionExtension on SortDirection {
  bool get isAscending => this == SortDirection.ascending;
  bool get isDescending => this == SortDirection.descending;
}

extension DisplayItemsExtension on DisplayItems {
  bool get isGridView => this == DisplayItems.gridView;
  bool get isListView => this == DisplayItems.listView;
}
