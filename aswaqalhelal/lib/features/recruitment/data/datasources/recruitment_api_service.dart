import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/cloud_functions.dart';
import 'package:root_package/packages/injectable.dart';

import '../../domain/repositories/recruitment_repository.dart';
import '../models/employee_model.dart';
import '../models/job_offer_model.dart';

abstract class RecruitmentApiService {
  Future<List<EmployeeModel>> getEmployees(GetEmployeesParams params);
  Future<List<JobOfferModel>> getSentJobOffers(GetSentJobOffersParams params);

  Future<String> removeEmployee(RemoveEmployeeParams params);
  Future<JobOfferModel> sendJobOffer(SendJobOfferParams params);

  Future<String> removeJobOffer(RemoveJobOfferParams params);
}

@LazySingleton(as: RecruitmentApiService)
class RecruitmentApiServiceImpl extends RecruitmentApiService {
  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;
  RecruitmentApiServiceImpl(this._firestore, this._functions);
  @override
  Future<List<EmployeeModel>> getEmployees(GetEmployeesParams params) async {
    final collection = _firestore.collection('employees');

    final snapshot = await collection
        .where('institutionId', isEqualTo: params.institutionId)
        .get();
    final employees = snapshot.docs.map(EmployeeModel.fromFirestore).toList();
    return employees;
  }

  @override
  Future<List<JobOfferModel>> getSentJobOffers(
      GetSentJobOffersParams params) async {
    final collection = _firestore.collection('jobs_offers');

    final snapshot = await collection
        .where('institutionId', isEqualTo: params.institutionId)
        .get();
    final jobOffers = snapshot.docs.map(JobOfferModel.fromFirestore).toList();
    return jobOffers;
  }

  @override
  Future<String> removeEmployee(RemoveEmployeeParams params) async {
    final doc = _firestore.doc('employees/${params.employee.userId}');

    await doc.delete();
    return params.employee.userId;
  }

  @override
  Future<JobOfferModel> sendJobOffer(SendJobOfferParams params) async {
    final result =
        await _functions.httpsCallable('jobOffer').call<Map<String, dynamic>>({
      'ownerId': params.ownerId,
      'institutionId': params.institutionId,
      'phoneNumber': params.phoneNumber,
      'role': params.role,
      'state': params.state.message
    });

    result.data['creationTime'] = Timestamp.fromDate(DateTime.now());
    return JobOfferModel.fromJson(result.data);
  }

  @override
  Future<String> removeJobOffer(RemoveJobOfferParams params) async {
    final doc = _firestore.doc('jobs_offers/${params.jobOffer.id}');

    await doc.delete();
    return params.jobOffer.id;
  }
}
