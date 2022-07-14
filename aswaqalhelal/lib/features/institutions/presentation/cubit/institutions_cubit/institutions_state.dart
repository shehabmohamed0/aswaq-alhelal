part of 'institutions_cubit.dart';

abstract class InstitutionsState extends Equatable {
  const InstitutionsState();

  @override
  List<Object> get props => [];
}

class InstitutionsInitial extends InstitutionsState {}

class InstitutionsLoading extends InstitutionsState {}

class InstitutionsEmpty extends InstitutionsState {}

class InstitutionsLoaded extends InstitutionsState {
  final List<Institution> institutions;

  const InstitutionsLoaded({
    required this.institutions,
  });

  InstitutionsLoaded copyWith({
    List<Institution>? institutions,
  }) {
    return InstitutionsLoaded(
      institutions: institutions ?? this.institutions,
    );
  }
  @override
  List<Object> get props => [institutions];
}

class InstitutionsError extends InstitutionsState {}
