import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../institution_items/domain/entities/institution_item.dart';

part 'items_widget_cubit.freezed.dart';
part 'items_widget_state.dart';

@injectable
class ItemsWidgetCubit extends Cubit<ItemsWidgetState> {
  ItemsWidgetCubit() : super(const ItemsWidgetState());

  void displayChanged(DisplayItems displayItems) {
    emit(state.copyWith(displayItem: displayItems));
  }

  void initialized(List<InstitutionItem> items) {
    emit(state.copyWith(items: items));
  }

  void startSearch() {
    emit(state.copyWith(isSearching: true));
  }

  void search(String val) {
    final searchItem =
        state.items.where((element) => element.name.contains(val)).toList();
    emit(state.copyWith(searchItems: searchItem, searchValue: val));
  }

  void endSearch() {
    emit(state.copyWith(isSearching: false, searchItems: [], searchValue: ''));
  }

  void addItem(InstitutionItem institutionItem) {
    final sortedList = _sort(List.of(state.items)..add(institutionItem),
        state.sortType, state.sortDirection);
    emit(state.copyWith(items: sortedList));
  }

  void updateInstitutionItem(InstitutionItem institution) {
    final index =
        state.items.indexWhere((element) => element.id == institution.id);
    final list = List.of(state.items)
      ..removeAt(index)
      ..add(institution);
    final sortedList = _sort(list, state.sortType, state.sortDirection);
    emit(state.copyWith(items: sortedList));
  }

  void sort(SortType sortType, SortDirection sortDirection) {
    if (_noChange(state, sortType, sortDirection)) {
      return;
    }
    List<InstitutionItem> sortedList =
        _sort(state.items, sortType, sortDirection);
    emit(state.copyWith(
      items: sortedList,
      sortType: sortType,
      sortDirection: sortDirection,
    ));
  }

  List<InstitutionItem> _sort(List<InstitutionItem> items, SortType sortType,
      SortDirection sortDirection) {
    late final List<InstitutionItem> sortedList;
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
      ItemsWidgetState state, SortType sortType, SortDirection sortDirection) {
    return state.sortType == sortType && state.sortDirection == sortDirection;
  }

  List<InstitutionItem> _sortAlphabetically(List<InstitutionItem> items,
      SortDirection sortDirection, SortType sortType) {
    final list = List.of(items)
      ..sort(
        sortDirection == SortDirection.ascending
            ? _sortAlphbeticallyAscending
            : _sortAlphbeticallyDescending,
      );

    return list;
  }

  List<InstitutionItem> _sortByTime(List<InstitutionItem> items,
      SortDirection sortDirection, SortType sortType) {
    final list = List.of(items)
      ..sort(sortDirection == SortDirection.ascending
          ? _timeComparatorAscending
          : _timeComparatorDescending);
    return list;
  }

  int _sortAlphbeticallyAscending(InstitutionItem a, InstitutionItem b) {
    return a.name.compareTo(b.name);
  }

  int _sortAlphbeticallyDescending(InstitutionItem a, InstitutionItem b) {
    return _sortAlphbeticallyAscending(b, a);
  }

  int _timeComparatorAscending(InstitutionItem a, InstitutionItem b) {
    if (a.creationTime.isBefore(b.creationTime)) {
      return -1;
    } else if (a.creationTime.isAfter(b.creationTime)) {
      return 1;
    } else {
      return 0;
    }
  }

  int _timeComparatorDescending(InstitutionItem a, InstitutionItem b) {
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
