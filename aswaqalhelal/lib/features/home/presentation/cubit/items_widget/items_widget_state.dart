part of 'items_widget_cubit.dart';

class ItemsWidgetState2<T> extends Equatable {
  final List<T> items;
  final List<T> searchItems;
  final SortType sortType;
  final SortDirection sortDirection;
  final DisplayItems displayItem;
  final bool isSearching;
  final String searchValue;

  final String Function(T item) stringValue;
  final DateTime Function(T item) dateTimeValue;
  const ItemsWidgetState2({
    this.items = const [],
    this.searchItems = const [],
    this.sortType = SortType.creationTime,
    this.sortDirection = SortDirection.descending,
    this.displayItem = DisplayItems.listView,
    this.isSearching = false,
    this.searchValue = '',
    required this.stringValue,
    required this.dateTimeValue,
  });

  ItemsWidgetState2<T> copyWith({
    List<T>? items,
    List<T>? searchItems,
    SortType? sortType,
    SortDirection? sortDirection,
    DisplayItems? displayItem,
    bool? isSearching,
    String? searchValue,
  }) {
    return ItemsWidgetState2<T>(
        items: items ?? this.items,
        searchItems: searchItems ?? this.searchItems,
        sortType: sortType ?? this.sortType,
        sortDirection: sortDirection ?? this.sortDirection,
        displayItem: displayItem ?? this.displayItem,
        isSearching: isSearching ?? this.isSearching,
        searchValue: searchValue ?? this.searchValue,
        dateTimeValue: dateTimeValue,
        stringValue: stringValue);
  }

  @override
  List<Object> get props {
    return [
      items,
      searchItems,
      sortType,
      sortDirection,
      displayItem,
      isSearching,
      searchValue
    ];
  }
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
