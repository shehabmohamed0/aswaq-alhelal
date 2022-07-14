import 'package:aswaqalhelal/features/institutions/domain/entities/institution.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../domain/usecases/get_institutions.dart';

part 'institutions_state.dart';

@injectable
class InstitutionsCubit extends Cubit<InstitutionsState> {
  InstitutionsCubit(this._getInstitutions) : super(InstitutionsInitial());
  final GetInstitutions _getInstitutions;

  Future<void> getInstitutions() async {
    emit(InstitutionsLoading());
    final either = await _getInstitutions(params: NoArgsParams());
    either.fold(
      (failure) {
        emit(InstitutionsError());
      },
      (institutions) {
        institutions.isEmpty
            ? emit(InstitutionsEmpty())
            : emit(InstitutionsLoaded(institutions: institutions));
      },
    );
  }

  void addInstitution(Institution institution) {
    if (state is InstitutionsEmpty) {
      emit(InstitutionsLoaded(institutions: [institution]));
    } else if (state is InstitutionsLoaded) {
      var currentState = (state as InstitutionsLoaded);
      final newList = List.of(currentState.institutions)..add(institution);
      emit(InstitutionsLoaded(institutions: newList));
    }
  }

  updateInstitution(Institution institution) {
    if (state is InstitutionsLoaded) {
      var currentState = (state as InstitutionsLoaded);
      final newList = List.of(currentState.institutions.map((element) {
        if (element.id == institution.id) {
          return institution;
        }
        return element;
      }));
      emit(InstitutionsLoaded(institutions: newList));
    }
  }
}
