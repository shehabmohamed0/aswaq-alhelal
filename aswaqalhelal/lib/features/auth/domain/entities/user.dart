import 'package:aswaqalhelal/features/auth/domain/entities/base_profile.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final List<BaseProfile> profiles;

  const User({required this.id, required this.profiles});

  bool get isEmpty => id.isEmpty && profiles.isEmpty;
  BaseProfile get userProfile =>
      profiles.firstWhere((profile) => profile.type == ProfileType.user);
  @override
  List<Object?> get props => [id, profiles];
}
