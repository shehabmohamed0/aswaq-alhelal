import 'base_profile.dart';

class SystemProfile extends BaseProfile {
  final String arabicName;
  const SystemProfile({
    required super.id,
    required super.userId,
    required this.arabicName,
    required super.name,
    super.type = ProfileType.system,
  });

  @override
  List<Object?> get props => [id, userId, arabicName, name, type];
}
