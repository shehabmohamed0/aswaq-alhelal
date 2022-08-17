import '../../../features/address/data/models/address_model.dart';
import '../../../features/address/data/models/geo_point_model.dart';
import '../../../features/address_suggestions/domain/entities/entities.dart';
import '../../../features/user_institutions/data/models/institution_model.dart';

class AddInstitutionParams {
  final String officialName;
  final String nickName;
  final List<String> emails;
  final List<String> phoneNumbers;
  final AddressDetails addressDetails;

  AddInstitutionParams({
    required this.officialName,
    required this.nickName,
    required this.emails,
    required this.phoneNumbers,
    required this.addressDetails,
  });

  InstitutionModel toModel(String id, String userId) => InstitutionModel(
        id: id,
        userId: userId,
        officialName: officialName,
        nickName: nickName,
        emails: emails,
        creationTime: DateTime.now(),
        phoneNumbers: phoneNumbers,
        addressModel: AddressModel(
          id: 'addressId',
          country: 'egypt',
          governate: addressDetails.refGovernate.name,
          city: addressDetails.refCity.name,
          neighborhood: addressDetails.refNeighborhood.name,
          description: 'description',
          geoPointModel: GeoPointModel(
            lat: addressDetails.geoPoint.lat,
            long: addressDetails.geoPoint.long,
          ),
          cityId: '',
          governateId: '',
          neighborhoodId: '',
        ),
      );
}