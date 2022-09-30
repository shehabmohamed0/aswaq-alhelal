import '../../../features/address/data/models/address_model.dart';
import '../../../features/address/data/models/geo_point_model.dart';
import '../../../features/address_suggestions/domain/entities/entities.dart';
import '../../../features/auth/data/models/user/institution_profile_model.dart';
import '../../../features/auth/domain/entities/base_profile.dart';

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

  InstitutionProfileModel toModel(String id, String userId) {
    final refAddressDetails = addressDetails.refAddressDetails;
    final geoPoint = addressDetails.geoPoint;
    return InstitutionProfileModel(
      id: id,
      userId: userId,
      name: officialName,
      nickName: nickName,
      emails: emails,
      creationTime: DateTime.now(),
      phoneNumbers: phoneNumbers,
      type: ProfileType.institution,
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
