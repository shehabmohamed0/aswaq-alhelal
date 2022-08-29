import '../../../features/address/data/models/address_model.dart';
import '../../../features/address/data/models/geo_point_model.dart';
import '../../../features/address_suggestions/domain/entities/entities.dart';
import '../../../features/user_institutions/data/models/institution_model.dart';

class AddInstitutionParams {
  final String officialName;
  final String nickName;
  final List<String> emails;
  final List<String> phoneNumbers;
  final FullAddressDetails addressDetails;

  AddInstitutionParams({
    required this.officialName,
    required this.nickName,
    required this.emails,
    required this.phoneNumbers,
    required this.addressDetails,
  });

  InstitutionModel toModel(String id, String userId) {
    final refAddressDetails = addressDetails.refAddressDetails;
    final geoPoint = addressDetails.geoPoint;
    return InstitutionModel(
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
        governateId: refAddressDetails.refGovernate.id,
        governate: refAddressDetails.refGovernate.name,
        cityId: refAddressDetails.refCity.id,
        city: refAddressDetails.refCity.name,
        neighborhoodId: refAddressDetails.refNeighborhood.id,
        neighborhood: refAddressDetails.refNeighborhood.name,
        description: 'description',
        geoPointModel: GeoPointModel(
          lat: geoPoint.lat,
          long: geoPoint.long,
        ),
      ),
    );
  }
}
