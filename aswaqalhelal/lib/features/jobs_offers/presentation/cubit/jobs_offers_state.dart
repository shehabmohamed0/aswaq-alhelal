part of 'jobs_offers_cubit.dart';

class JobsOffersState extends Equatable {
  const JobsOffersState({
    this.jobsOffers = const [],
    this.jobsOffersState = RequestState.initial,
    this.updateOfferState = RequestState.initial,
    this.errorMessage,
  });

  final List<JobOffer> jobsOffers;
  final RequestState jobsOffersState;
  final RequestState updateOfferState;
  final String? errorMessage;

  JobsOffersState copyWith({
    List<JobOffer>? jobsOffers,
    RequestState? jobsOffersState,
    RequestState? updateOfferState,
    String? errorMessage,
  }) {
    return JobsOffersState(
      jobsOffers: jobsOffers ?? this.jobsOffers,
      jobsOffersState: jobsOffersState ?? this.jobsOffersState,
      updateOfferState: updateOfferState ?? this.updateOfferState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [jobsOffers, jobsOffersState, updateOfferState, errorMessage];
}
