
import '../../../address/domain/entities/address.dart';
import 'base_profile.dart';

class InstitutionProfile extends BaseProfile {
  final String nickName;
  final List<String> emails;
  final List<String> phoneNumbers;
  final DateTime creationTime;
  final Address address;

  const InstitutionProfile({
    required super.id,
    required super.userId,
    required super.name,
    required super.type,
    super.photoURL,
    required this.nickName,
    required this.emails,
    required this.phoneNumbers,
    required this.creationTime,
    required this.address,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        type,
        photoURL,
        nickName,
        emails,
        phoneNumbers,
        creationTime,
        address
      ];
}
