import 'package:aswaqalhelal/core/extensions/prepare_for_search.dart';
import 'package:bloc/bloc.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

part 'items_widget_state.dart';

class ItemsWidgetCubit2<T> extends Cubit<ItemsWidgetState2<T>> {
  ItemsWidgetCubit2({
    required String Function(T) stringValue,
    required DateTime Function(T) dateTimeValue,
  }) : super(ItemsWidgetState2<T>(
            stringValue: stringValue, dateTimeValue: dateTimeValue));

  void displayChanged(DisplayItems displayItems) {
     emit(state.copyWith(displayItem: displayItems));
  }

  void initialized(List<T> items) {
    emit(state.copyWith(items: items));
  }

  void startSearch() {
    emit(state.copyWith(isSearching: true));
  }

  void search(String val) {
  
    final searchItem = state.items
        .where((element) => state
            .stringValue(element)
            .prepareForSearch()
            .contains(val.prepareForSearch()))
        .toList();
    emit(state.copyWith(searchItems: searchItem, searchValue: val));
  }

  void endSearch() {
    emit(state.copyWith(isSearching: false, searchItems: [], searchValue: ''));
  }

  void sort(SortType sortType, SortDirection sortDirection) {
    if (_noChange(state, sortType, sortDirection)) {
      return;
    }
    List<T> sortedList = _sort(state.items, sortType, sortDirection);
    emit(state.copyWith(
      items: sortedList,
      sortType: sortType,
      sortDirection: sortDirection,
    ));
  }

  List<T> _sort(List<T> items, SortType sortType, SortDirection sortDirection) {
    late final List<T> sortedList;
    switch (sortType) {
      case SortType.alphabetically:
        sortedList = _sortAlphabetically(items, sortDirection, sortType);
        break;

      case SortType.creationTime:
        sortedList = _sortByTime(items, sortDirection, sortType);
        break;
    }
    return sortedList;
  }

  bool _noChange(
      ItemsWidgetState2 state, SortType sortType, SortDirection sortDirection) {
    return state.sortType == sortType && state.sortDirection == sortDirection;
  }

  List<T> _sortAlphabetically(
      List<T> items, SortDirection sortDirection, SortType sortType) {
    final list = List.of(items)
      ..sort(
        sortDirection == SortDirection.ascending
            ? _sortAlphbeticallyAscending
            : _sortAlphbeticallyDescending,
      );

    return list;
  }

  List<T> _sortByTime(
      List<T> items, SortDirection sortDirection, SortType sortType) {
    final list = List.of(items)
      ..sort(sortDirection == SortDirection.ascending
          ? _timeComparatorAscending
          : _timeComparatorDescending);
    return list;
  }

  int _sortAlphbeticallyAscending(T a, T b) {
    return state.stringValue(a).compareTo(state.stringValue(b));
  }

  int _sortAlphbeticallyDescending(T a, T b) {
    return _sortAlphbeticallyAscending(b, a);
  }

  int _timeComparatorAscending(T a, T b) {
    if (state.dateTimeValue(a).isBefore(state.dateTimeValue(b))) {
      return -1;
    } else if (state.dateTimeValue(a).isAfter(state.dateTimeValue(b))) {
      return 1;
    } else {
      return 0;
    }
  }

  int _timeComparatorDescending(T a, T b) {
    return _invert(_timeComparatorAscending(a, b));
  }

  int _invert(int val) {
    if (val > 0) {
      return val - 2;
    } else if (val < 0) {
      return val + 2;
    } else {
      return val;
    }
  }
}
