import 'package:aswaqalhelal/core/params/add_item/params.dart';
import 'package:aswaqalhelal/features/instutution_items/domain/entities/institution_item.dart';
import 'package:aswaqalhelal/features/instutution_items/domain/usecases/get_institution_items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/packages/injectable.dart';

part 'instutution_items_state.dart';
@injectable
class InstitutionItemsCubit extends Cubit<InstitutionItemsState> {
  final GetInstitutionItems _getInstitutionItems;

  InstitutionItemsCubit(this._getInstitutionItems)
      : super(InstitutionItemsInitial());

  Future<void> getInstitutionsItems(String institutionId) async {
    emit(InstitutionsItemsLoading());
    final either = await _getInstitutionItems(
        params: GetInstitutionItemsParams(institutionId));
    either.fold(
      (failure) {
        emit(InstitutionsItemsError());
      },
      (items) {
        items.isEmpty
            ? emit(InstitutionItemsEmpty())
            : emit(InstitutionItemsLoaded(items: items));
      },
    );
  }

  void addItem(InstitutionItem institution) {
    if (state is InstitutionItemsEmpty) {
      emit(InstitutionItemsLoaded(items: [institution]));
    } else if (state is InstitutionItemsLoaded) {
      var currentState = (state as InstitutionItemsLoaded);
      final newList = List.of(currentState.items)..add(institution);
      emit(InstitutionItemsLoaded(items: newList));
    }
  }

  updateInstitution(InstitutionItem institution) {
    if (state is InstitutionItemsLoaded) {
      var currentState = (state as InstitutionItemsLoaded);
      final newList = List.of(currentState.items.map((element) {
        if (element.id == institution.id) {
          return institution;
        }
        return element;
      }));
      emit(InstitutionItemsLoaded(items: newList));
    }
  }
}
