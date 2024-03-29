part of 'work_institutions_cubit.dart';

class WorkInstitutionsState extends Equatable {
  final List<InstitutionProfile> institutions;
  final RequestState institutionsState;

  const WorkInstitutionsState({
    this.institutions = const [],
    this.institutionsState = RequestState.initial,
  });

  WorkInstitutionsState copyWith({
    List<InstitutionProfile>? institutions,
    RequestState? institutionsState,
  }) {
    return WorkInstitutionsState(
      institutions: institutions ?? this.institutions,
      institutionsState: institutionsState ?? this.institutionsState,
    );
  }

  @override
  List<Object?> get props => [institutions, institutionsState];
}
