part of 'institutions_cubit.dart';

abstract class UserInstitutionsState extends Equatable {
  const UserInstitutionsState();

  @override
  List<Object> get props => [];
}

class InstitutionsInitial extends UserInstitutionsState {}

class InstitutionsLoading extends UserInstitutionsState {}

class InstitutionsEmpty extends UserInstitutionsState {}

class InstitutionsLoaded extends UserInstitutionsState {
  final List<InstitutionProfile> institutions;

  const InstitutionsLoaded({
    required this.institutions,
  });

  InstitutionsLoaded copyWith({
    List<InstitutionProfile>? institutions,
  }) {
    return InstitutionsLoaded(
      institutions: institutions ?? this.institutions,
    );
  }
  @override
  List<Object> get props => [institutions];
}

class InstitutionsError extends UserInstitutionsState {}
