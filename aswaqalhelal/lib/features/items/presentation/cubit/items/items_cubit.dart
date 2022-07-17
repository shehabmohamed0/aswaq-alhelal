import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../instutution_items/domain/entities/institution_item.dart';
import '../../../domain/usecases/get_items.dart';

part 'items_state.dart';
part 'items_cubit.freezed.dart';

@injectable
class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit(this._getItems) : super(const ItemsState.initial());
  final GetItems _getItems;

  Future<void> getItems() async {
    emit(const ItemsState.loading());
    final either = await _getItems(params: NoArgsParams());

    either.fold((failure) {
      failure as ServerFailure;
      emit(ItemsState.error(message: failure.message));
    }, (items) {
      emit(ItemsState.loaded(items: items));
    });
  }

  void displayChanged(DisplayItems displayItems) {
    state.mapOrNull(loaded: (state) {
      emit(state.copyWith(displayItem: displayItems));
    });
  }

  void startSearch() {
    state.mapOrNull(loaded: (state) {
      emit(state.copyWith(isSearching: true));
    });
  }

  void endSearch() {
    state.mapOrNull(loaded: (state) {
      emit(
          state.copyWith(isSearching: false, searchItems: [], searchValue: ''));
    });
  }

  void search(String val) {
    state.mapOrNull(loaded: (state) {
      final searchItem =
          state.items.where((element) => element.name.contains(val)).toList();
      emit(state.copyWith(searchItems: searchItem, searchValue: val));
    });
  }

  void sort(SortType sortType, SortDirection sortDirection) {
    state.mapOrNull(
      loaded: (state) {
        if (_noChange(state, sortType, sortDirection)) {
          return;
        }
        switch (sortType) {
          case SortType.alphabetically:
            _sortAlphabetically(state, sortDirection, sortType);
            break;

          case SortType.creationTime:
            _sortByTime(state, sortDirection, sortType);
            break;
        }
      },
    );
  }

  bool _noChange(Loaded state, SortType sortType, SortDirection sortDirection) {
    return state.sortType == sortType && state.sortDirection == sortDirection;
  }

  void _sortByTime(
      Loaded state, SortDirection sortDirection, SortType sortType) {
    final list = List.of(state.items)
      ..sort(sortDirection == SortDirection.ascending
          ? _timeComparatorAscending
          : _timeComparatorDescending);
    emit(
      state.copyWith(
          items: list, sortType: sortType, sortDirection: sortDirection),
    );
  }

  void _sortAlphabetically(
      Loaded state, SortDirection sortDirection, SortType sortType) {
    final list = List.of(state.items)
      ..sort(
        sortDirection == SortDirection.ascending
            ? _sortAlphbeticallyAscending
            : _sortAlphbeticallyDescending,
      );

    emit(
      state.copyWith(
          items: list, sortDirection: sortDirection, sortType: sortType),
    );
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
