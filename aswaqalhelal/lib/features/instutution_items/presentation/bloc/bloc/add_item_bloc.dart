import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:root_package/core/failures/file_upload_failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/core/form_inputs/required_string.dart';
import 'package:root_package/core/utils/image_utils.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/image_picker.dart';
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
import '../../../domain/usecases/update_institution_item.dart';
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
  final UpdateInstitutionItem _updateInstitutionItem;
  AddItemBloc(
    this._searchItem,
    this._addInstitutionItem,
    this._addRefAndInstitutionItem,
    this._updateInstitutionItem,
  ) : super(const AddItemState()) {
    on<AddItemSearch>(_onAddItemSearch, transformer: debounce());
    on<AddItemSelectedEvent>(_onAddItemSelectedEvent);
    on<AddNewItem>(_onAddNewItem);
    on<AddUnitEvent>(_onAddUnitEvent);
    on<RemoveUnitEvent>(_onRemoveUnitEvent);
    on<AddItemSubmit>(_onAddItemSubmit);
    on<RemoveSelectionPressed>(_onRemoveSelectionPressed);
    on<SelectImagePressed>(_onSelectImagePressed);
    on<InitEdit>(_onInitEdit);
    on<DeleteImageFile>(_onDeleteImageFile);
    on<DeleteImageUrl>(_onDeleteImageUrl);
  }

  FutureOr<void> _onAddItemSearch(
    AddItemSearch event,
    Emitter<AddItemState> emit,
  ) async {
    if (event.value.isNotEmpty && event.value.length > 2) {
      emit(state.copyWith(suggestionState: AutoSuggestionState.loading));
      final either = await _searchItem(params: SearchItemParams(event.value));
      either.fold(
        (failure) =>
            emit(state.copyWith(suggestionState: AutoSuggestionState.error)),
        (items) => emit(state.copyWith(
          suggestions: items,
          suggestionState: AutoSuggestionState.loaded,
        )),
      );
    } else {
      emit(state.copyWith(suggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onAddItemSelectedEvent(
      AddItemSelectedEvent event, Emitter<AddItemState> emit) {
    emit(
      state.copyWith(
        selectedItem: RequiredObject.dirty(event.item),
        itemName: RequiredString.dirty(event.item.name),
        units: event.item.units,
        imageFile: const RequiredObject.pure(),
        itemFromReference: true,
        addingNewItem: false,
        imageUrl: RequiredObject.dirty(event.item.imageUrl),
      ),
    );
  }

  FutureOr<void> _onAddNewItem(AddNewItem event, Emitter<AddItemState> emit) {
    emit(
      state.copyWith(
        itemName: RequiredString.dirty(event.itemName),
        itemFromReference: false,
        addingNewItem: true,
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
    log('1');
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    log('2');

    if (!state.isEdit) {
      log('3');

      final index =
          event.currentItems.indexWhere((e) => e.name == state.itemName.value);

      if (index != -1) {
        log('4');

        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: 'Item name already exists.'));
        return;
      }
    }
    if (state.isEdit) {
      log('5');

      final either = await _updateInstitutionItem(
        params: UpdateInstitutionItemParams(
          oldItem: state.oldItem!,
          imageFile: state.imageFile.value,
          imageUrl: state.imageUrl.value,
          units: state.units,
        ),
      );

      either.fold(
        (failure) {
          log('6');
          if (failure is ServerFailure) {
            emit(
              state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: failure.message,
              ),
            );
          } else if (failure is UploadFileFailure) {
            emit(
              state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: failure.message,
              ),
            );
          }
        },
        (item) {
          log('7');
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
              institutionItem: item,
            ),
          );
        },
      );
      return;
    }

    if (!state.itemFromReference) {
      final either = await _addRefAndInstitutionItem(
        params: AddRefAndInstitutionItemParams(
          itemName: state.itemName.value,
          imageFile: state.imageFile.value!,
          units: state.units,
          institutionId: event.institutionId,
        ),
      );

      either.fold(
        (failure) {
          if (failure is ServerFailure) {
            emit(
              state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: failure.message,
              ),
            );
          } else if (failure is UploadFileFailure) {
            emit(
              state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: failure.message,
              ),
            );
          }
        },
        (institutionItem) => emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          institutionItem: institutionItem,
        )),
      );
    } else {
      final either = await _addInstitutionItem(
        params: AddInstitutionItemParams(
          itemName: state.itemName.value,
          imageFile: state.imageFile.value,
          institutionId: event.institutionId,
          imageUrl: state.imageUrl.value,
          referenceId: state.selectedItem.value!.id,
          units: state.units,
        ),
      );

      either.fold((failure) {
        if (failure is ServerFailure) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: failure.message));
        } else if (failure is UploadFileFailure) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: (failure as ServerFailure).message));
        }
      }, (institutionItem) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          institutionItem: institutionItem,
        ));
      });
    }
  }

  FutureOr<void> _onRemoveSelectionPressed(
      RemoveSelectionPressed event, Emitter<AddItemState> emit) {
    emit(state.copyWith(
      selectedItem: const RequiredObject.pure(),
      itemName: const RequiredString.pure(),
      itemFromReference: false,
      imageUrl: RequiredObject.pure(),
      addingNewItem: false,
      suggestionState: AutoSuggestionState.emptyText,
    ));
  }

  FutureOr<void> _onSelectImagePressed(
      SelectImagePressed event, Emitter<AddItemState> emit) async {
    final image = await ImageUtils.pickAndCompressImage(event.source,
        width: 200, height: 200);

    image.fold(() {}, (file) {
      emit(state.copyWith(
        imageFile: RequiredObject.dirty(file),
      ));
    });
  }

  FutureOr<void> _onInitEdit(InitEdit event, Emitter<AddItemState> emit) {
    emit(
      AddItemState(
          imageUrl: RequiredObject.dirty(event.item.imageUrl),
          units: event.item.units,
          itemName: RequiredString.dirty(event.item.name),
          isEdit: true,
          itemFromReference: true,
          oldItem: event.item),
    );
  }

  FutureOr<void> _onDeleteImageFile(
      DeleteImageFile event, Emitter<AddItemState> emit) {
    emit(state.copyWith(
      imageFile: const RequiredObject.dirty(null),
    ));
  }

  FutureOr<void> _onDeleteImageUrl(
      DeleteImageUrl event, Emitter<AddItemState> emit) {
    emit(state.copyWith(imageUrl: RequiredObject.pure()));
  }
}
