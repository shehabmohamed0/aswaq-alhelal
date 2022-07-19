import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/required_string.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';

import '../../../../../core/params/add_item/params.dart';
import '../../../../../core/params/add_item/search_item_params.dart';
import '../../../domain/entities/institution_item.dart';
import '../../../domain/entities/reference_item.dart';
import '../../../domain/entities/unit.dart';
import '../../../domain/usecases/add_instition_item.dart';
import '../../../domain/usecases/add_ref_and_institution_item.dart';
import '../../../domain/usecases/search_item.dart';
import '../../pages/add_item/widgets/auto_suggest_text_field.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

@injectable
class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  final SearchItem _searchItem;
  final AddRefAndInstitutionItem _addRefAndInstitutionItem;
  final AddInstitutionItem _addInstitutionItem;
  AddItemBloc(
    this._searchItem,
    this._addInstitutionItem,
    this._addRefAndInstitutionItem,
  ) : super(const AddItemState()) {
    on<AddItemSearch>(_onAddItemSearch, transformer: debounce());
    on<AddItemSelectedEvent>(_onAddItemSelectedEvent);
    on<AddNewItem>(_onAddNewItem);
    on<AddUnitEvent>(_onAddUnitEvent);
    on<RemoveUnitEvent>(_onRemoveUnitEvent);
    on<AddItemSubmit>(_onAddItemSubmit);
  }

  FutureOr<void> _onAddItemSearch(
    AddItemSearch event,
    Emitter<AddItemState> emit,
  ) async {
    if (event.value.isNotEmpty && event.value.length > 2) {
      emit(state.copyWith(suggestionState: AutoSuggestionState.loading));
      final either = await _searchItem(params: SearchItemParams(event.value));
      either.fold(
        (failure) {
          emit(
            state.copyWith(suggestionState: AutoSuggestionState.error),
          );
        },
        (items) {
          emit(state.copyWith(
              suggestions: items, suggestionState: AutoSuggestionState.loaded));
        },
      );
    } else {
      emit(state.copyWith(suggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onAddItemSelectedEvent(
      AddItemSelectedEvent event, Emitter<AddItemState> emit) {
    emit(
      state.copyWith(
        item: event.item,
        itemName: RequiredString.dirty(event.item.name),
        units: event.item.units,
        isNewItem: false,
      ),
    );
  }

  FutureOr<void> _onAddNewItem(AddNewItem event, Emitter<AddItemState> emit) {
    emit(
      state.copyWith(
        itemName: RequiredString.dirty(event.itemName),
        isNewItem: true,
      ),
    );
  }

  FutureOr<void> _onAddUnitEvent(
      AddUnitEvent event, Emitter<AddItemState> emit) {
    emit(state.copyWith(units: List.of(state.units)..add(event.unit)));
  }

  FutureOr<void> _onRemoveUnitEvent(
      RemoveUnitEvent event, Emitter<AddItemState> emit) {
    emit(state.copyWith(units: List.of(state.units)..removeAt(event.index)));
  }

  FutureOr<void> _onAddItemSubmit(
      AddItemSubmit event, Emitter<AddItemState> emit) async {
    if (state.status.isSubmissionInProgress) {
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final index =
        event.currentItems.indexWhere((e) => e.name == state.itemName.value);

    if (index != -1) {
      emit(
        state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: 'Item name already exists.'),
      );
      return;
    }

    if (state.isNewItem) {
      final either = await _addRefAndInstitutionItem(
        params: AddRefAndInstitutionItemParams(
          itemName: state.itemName.value,
          imageFile: state.imageFile!,
          units: state.units,
          institutionId: event.institutionId,
        ),
      );
      either.fold((failure) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: (failure as ServerFailure).message));
      }, (institutionItem) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          institutionItem: institutionItem,
        ));
      });
    } else {
      final either = await _addInstitutionItem(
        params: AddInstitutionItemParams(
          itemName: state.itemName.value,
          imageFile: state.imageFile!,
          institutionId: event.institutionId,
          referenceId: state.item!.id,
          units: state.units,
        ),
      );
      either.fold((failure) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: (failure as ServerFailure).message));
      }, (institutionItem) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          institutionItem: institutionItem,
        ));
      });
    }
  }
}
