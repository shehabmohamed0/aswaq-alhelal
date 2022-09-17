import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/failures/receuitment/failures.dart';
import '../../../../../core/request_state.dart';
import '../../../../user_institutions/domain/entities/institution.dart';
import '../../../domain/entities/job_offer.dart';
import '../../../domain/repositories/recruitment_repository.dart';
import '../../../domain/usecases/get_sent_job_offers.dart';
import '../../../domain/usecases/remove_job_offer.dart';
import '../../../domain/usecases/send_job_offer.dart';

part 'send_job_offers_state.dart';

@injectable
class InstitutionJobsOffersCubit extends Cubit<InstitutionJobsOffersState> {
  InstitutionJobsOffersCubit(
    this._getSentJobOffers,
    this._sendJobOffer,
    this._removeJobOffer,
  ) : super(const InstitutionJobsOffersState());

  final GetSentJobOffers _getSentJobOffers;
  final SendJobOffer _sendJobOffer;
  final RemoveJobOffer _removeJobOffer;

  Future<void> getSentOffers(String institutionId) async {
    emit(state.copyWith(jobsOffersState: RequestState.loading));

    final either = await _getSentJobOffers(
        params: GetSentJobOffersParams(institutionId: institutionId));

    either.fold(
      (failure) => emit(state.copyWith(jobsOffersState: RequestState.error)),
      (employees) => emit(state.copyWith(
          jobsOffers: employees, jobsOffersState: RequestState.loaded)),
    );
  }

  Future<void> sendOffer(String institutionId, String ownerId,
      String phoneNumber, String role) async {
    emit(state.copyWith(addJobOfferState: RequestState.loading));
    final either = await _sendJobOffer(
        params: SendJobOfferParams(
      ownerId: ownerId,
      institutionId: institutionId,
      phoneNumber: phoneNumber,
      role: role,
      state: OfferState.pending,
    ));

    either.fold((failure) {
      if (failure is UserNotFoundFailure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          addJobOfferState: RequestState.error,
        ));
      } else if (failure is AlreadySendOfferFailure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          addJobOfferState: RequestState.error,
        ));
      } else {
        failure as ServerFailure;
        emit(state.copyWith(
          errorMessage: failure.message,
          addJobOfferState: RequestState.error,
        ));
      }
    },
        (jobOffer) => emit(state.copyWith(
              jobsOffers: List.of(state.jobsOffers)..add(jobOffer),
              addJobOfferState: RequestState.loaded,
            )));
  }
}
