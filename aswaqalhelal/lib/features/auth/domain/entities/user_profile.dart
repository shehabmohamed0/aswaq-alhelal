import '../../../address/domain/entities/address.dart';
import 'base_profile.dart';

class UserProfile extends BaseProfile {
  final String phoneNumber;
  final String? email;
  final DateTime? birthDate;
  final String? gender;
  final Address? address;
  const UserProfile({
    required super.id,
    required super.userId,
    required super.name,
    super.type = ProfileType.user,
    required this.phoneNumber,
    super.photoURL,
    this.email,
    this.birthDate,
    this.gender,
    this.address,
  });
  
  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        type,
        photoURL,
        phoneNumber,
        email,
        birthDate,
        address,
        gender
      ];
}
