import 'package:aswaqalhelal/features/client_institutions/data/datasources/client_institution_items_api.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../institution_items/domain/entities/institution_item.dart';
import '../../../user_institutions/domain/entities/institution.dart';
import '../../domain/repositories/client_institution_repository.dart';

@LazySingleton(as: ClientInstitutionRepository)
class ClientInstitutionRepositoryImpl extends ClientInstitutionRepository {
  final ClientInstitutionItemsApi _api;
  final NetworkInfo _networkInfo;

  ClientInstitutionRepositoryImpl(this._api, this._networkInfo);
  @override
  Future<Either<Failure, List<InstitutionItem>>> getClientInstitutionItems(
      Institution institution) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final items = await _api.getItems(institution);
      return Right(items);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
