import 'base_profile.dart';

class NonRegisteredProfile extends BaseProfile {
  final String phoneNumber;
  const NonRegisteredProfile({
    required super.id,
    required super.userId,
    required super.name,
    required this.phoneNumber,
  }) : super(type: ProfileType.nonRegistered);

  @override
  List<Object?> get props => [id, userId, name, phoneNumber, type];
}
