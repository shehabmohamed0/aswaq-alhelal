import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

import '../../data/models/job_offer_model.dart';
import '../entities/employee.dart';
import '../entities/job_offer.dart';

abstract class RecruitmentRepository {
  Future<Either<Failure, List<Employee>>> getEmployees(
      GetEmployeesParams params);
  Future<Either<Failure, String>> removeEmployee(RemoveEmployeeParams params);

  Future<Either<Failure, List<JobOffer>>> getSentJobOffers(
      GetSentJobOffersParams params);
  Future<Either<Failure, JobOffer>> sendJobOffer(SendJobOfferParams params);
  Future<Either<Failure, String>> removeJobOffer(RemoveJobOfferParams params);
}

class RemoveEmployeeParams {
  final Employee employee;

  RemoveEmployeeParams({required this.employee});
}

class GetEmployeesParams {
  final String institutionId;

  const GetEmployeesParams({required this.institutionId});
}

class GetSentJobOffersParams {
  final String institutionId;

  const GetSentJobOffersParams({required this.institutionId});
}

class SendJobOfferParams {
  final String ownerId;
  final String institutionId;
  final String phoneNumber;
  final String role;
  final OfferState state;

  SendJobOfferParams({
    required this.ownerId,
    required this.institutionId,
    required this.phoneNumber,
    required this.role,
    required this.state,
  });

  JobOfferModel toModel(String id) => JobOfferModel(
        id: id,
        ownerId: ownerId,
        institutionId: institutionId,
        phoneNumber: phoneNumber,
        role: role,
        state: state,
        creationTime: DateTime.now(),
      );
}

class RemoveJobOfferParams {
  final JobOffer jobOffer;

  RemoveJobOfferParams({required this.jobOffer});
}
