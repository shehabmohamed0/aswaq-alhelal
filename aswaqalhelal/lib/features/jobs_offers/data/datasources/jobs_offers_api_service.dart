import 'package:aswaqalhelal/features/recruitment/domain/entities/job_offer.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../recruitment/data/models/job_offer_model.dart';
import '../../domain/repositories/jobs_offers_repository.dart';

abstract class JobsOffersApiService {
  Future<List<JobOfferModel>> getJobOffers(GetJobsOffersParams params);
  Future<JobOfferModel> acceptJobOffers(AcceptJobsOfferParams params);
  Future<JobOfferModel> declineJobOffers(DeclineJobOfferParams params);
}

@LazySingleton(as: JobsOffersApiService)
class JobsOffersApiServiceImpl extends JobsOffersApiService {
  final FirebaseFirestore _firestore;
  JobsOffersApiServiceImpl(this._firestore);
  @override
  Future<List<JobOfferModel>> getJobOffers(GetJobsOffersParams params) async {
    final collection = _firestore.collection('jobs_offers');
    final snapshot = await collection
        .where('userId', isEqualTo: params.userId)
        .orderBy('creationTime', descending: true)
        .get();

    return snapshot.docs.map(JobOfferModel.fromFirestore).toList();
  }

  @override
  Future<JobOfferModel> acceptJobOffers(AcceptJobsOfferParams params) async {
    final doc = _firestore.doc('jobs_offers/${params.jobOffer.id}');
    doc.update({'state': OfferState.accepted.message});
    final jsonData = params.jobOffer.toModel().toJson();
    jsonData['state'] = OfferState.accepted.message;

    return JobOfferModel.fromJson(jsonData);
  }

  @override
  Future<JobOfferModel> declineJobOffers(DeclineJobOfferParams params) async {
    final doc = _firestore.doc('jobs_offers/${params.jobOffer.id}');
    doc.update({'state': OfferState.declined.message});
    final jsonData = params.jobOffer.toModel().toJson();
    jsonData['state'] = OfferState.declined.message;

    return JobOfferModel.fromJson(jsonData);
  }
}
