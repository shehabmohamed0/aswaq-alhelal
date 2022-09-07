part of 'send_job_offers_cubit.dart';

class InstitutionJobsOffersState extends Equatable {
  final List<JobOffer> jobsOffers;
  final RequestState jobsOffersState;
  final RequestState addJobOfferState;

  final String? errorMessage;
  const InstitutionJobsOffersState({
    this.jobsOffers = const [],
    this.jobsOffersState = RequestState.idle,
    this.addJobOfferState = RequestState.idle,
    this.errorMessage,
  });

  InstitutionJobsOffersState copyWith({
    List<JobOffer>? jobsOffers,
    RequestState? jobsOffersState,
    RequestState? addJobOfferState,
    String? errorMessage,
  }) {
    return InstitutionJobsOffersState(
      jobsOffers: jobsOffers ?? this.jobsOffers,
      jobsOffersState: jobsOffersState ?? this.jobsOffersState,
      addJobOfferState: addJobOfferState ?? this.addJobOfferState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [jobsOffers, jobsOffersState, addJobOfferState, errorMessage];
}
