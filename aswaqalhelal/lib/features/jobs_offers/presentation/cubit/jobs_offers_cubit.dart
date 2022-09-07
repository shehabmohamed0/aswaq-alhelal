import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/request_state.dart';
import '../../../recruitment/domain/entities/job_offer.dart';
import '../../domain/repositories/jobs_offers_repository.dart';
import '../../domain/usecases/accept_job_offer.dart';
import '../../domain/usecases/decline_job_offer.dart';
import '../../domain/usecases/get_jobs_offers.dart';

part 'jobs_offers_state.dart';

@injectable
class JobsOffersCubit extends Cubit<JobsOffersState> {
  JobsOffersCubit(
      this._getJobsOffers, this._acceptJobOffer, this._declineJobOffer)
      : super(const JobsOffersState());

  final GetJobsOffers _getJobsOffers;
  final AcceptJobOffer _acceptJobOffer;
  final DeclineJobOffer _declineJobOffer;

  Future<void> getJobOffers(String userId) async {
    emit(state.copyWith(jobsOffersState: RequestState.loading));

    final either =
        await _getJobsOffers(params: GetJobsOffersParams(userId: userId));

    either.fold(
        (failure) => emit(state.copyWith(
            jobsOffersState: RequestState.error,
            errorMessage: (failure as ServerFailure).message)),
        (jobsOffers) => emit(state.copyWith(
            jobsOffers: jobsOffers, jobsOffersState: RequestState.loaded)));
  }

  Future<void> acceptJobOffer(JobOffer jobOffer) async {
    emit(state.copyWith(updateOfferState: RequestState.loading));

    final either = await _acceptJobOffer(
        params: AcceptJobsOfferParams(jobOffer: jobOffer));

    either.fold(
        (failure) => emit(state.copyWith(
            updateOfferState: RequestState.error,
            errorMessage: (failure as ServerFailure).message)),
        (newJobOffer) => emit(
              state.copyWith(
                  jobsOffers: List.of(
                      state.jobsOffers.map((jobOffer) =>
                          jobOffer.id == newJobOffer.id
                              ? newJobOffer
                              : jobOffer),
                      growable: false),
                  updateOfferState: RequestState.loaded),
            ));
  }

  Future<void> declineJobOffer(JobOffer jobOffer) async {
    emit(state.copyWith(updateOfferState: RequestState.loading));

    final either = await _declineJobOffer(
        params: DeclineJobOfferParams(jobOffer: jobOffer));

    either.fold(
      (failure) => emit(state.copyWith(
          updateOfferState: RequestState.error,
          errorMessage: (failure as ServerFailure).message)),
      (newJobOffer) => emit(
        state.copyWith(
            jobsOffers: List.of(
              state.jobsOffers.map((jobOffer) =>
                  jobOffer.id == newJobOffer.id ? newJobOffer : jobOffer),
              growable: false,
            ),
            updateOfferState: RequestState.loaded),
      ),
    );
  }
}
