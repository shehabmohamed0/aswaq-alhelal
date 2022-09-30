import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/request_state.dart';
import '../../domain/usecases/get_work_institutions.dart';
import '../../domain/work_institution_repository.dart';

part 'work_institutions_state.dart';

@injectable
class WorkInstitutionsCubit extends Cubit<WorkInstitutionsState> {
  WorkInstitutionsCubit(this._getWorkInstitutions)
      : super(const WorkInstitutionsState());

  final GetWorkInstitutions _getWorkInstitutions;

  Future<void> getInstitutions(String userId) async {
    emit(state.copyWith(institutionsState: RequestState.loading));

    final either = await _getWorkInstitutions(
        params: GetWorkInstitutionsParams(userId: userId));

    either.fold(
        (failure) =>
            emit(state.copyWith(institutionsState: RequestState.error)),
        (institutions) => emit(state.copyWith(
            institutions: institutions,
            institutionsState: RequestState.loaded)));
  }
}
