import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../institution_items/domain/entities/institution_item.dart';
import '../../domain/repositories/client_institution_repository.dart';
import '../datasources/client_institution_items_api.dart';

@LazySingleton(as: ClientInstitutionRepository)
class ClientInstitutionRepositoryImpl extends ClientInstitutionRepository {
  final ClientInstitutionItemsApi _api;
  final NetworkInfo _networkInfo;

  ClientInstitutionRepositoryImpl(this._api, this._networkInfo);
  @override
  Future<Either<Failure, List<InstitutionItem>>> getClientInstitutionItems(
      InstitutionProfile institution) async {
    //Todo: Uncomment this

    // if (!await _networkInfo.isConnected) {
    //   return Left(ServerFailure.internetConnection());
    // }

    try {
      final items = await _api.getItems(institution);
      return Right(items);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
