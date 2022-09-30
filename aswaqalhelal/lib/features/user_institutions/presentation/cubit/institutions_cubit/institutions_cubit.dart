import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../domain/usecases/get_user_institutions.dart';

part 'institutions_state.dart';

@injectable
class UserInstitutionsCubit extends Cubit<UserInstitutionsState> {
  UserInstitutionsCubit(this._getInstitutions) : super(InstitutionsInitial());
  final GetUserInstitutions _getInstitutions;

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

  void addInstitution(InstitutionProfile institution) {
    if (state is InstitutionsEmpty) {
      emit(InstitutionsLoaded(institutions: [institution]));
    } else if (state is InstitutionsLoaded) {
      var currentState = (state as InstitutionsLoaded);
      final newList = List.of(currentState.institutions)..add(institution);
      emit(InstitutionsLoaded(institutions: newList));
    }
  }

  updateInstitution(InstitutionProfile institution) {
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
