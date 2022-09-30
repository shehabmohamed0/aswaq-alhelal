part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppUserChanged extends AppEvent {
  final User user;
  final String? profileId;
  const AppUserChanged(this.user, [this.profileId]);

  @override
  List<Object> get props => [user];
}

class ProfileChanged extends AppEvent {
  final BaseProfile profile;
  const ProfileChanged(this.profile);

  @override
  List<Object> get props => [profile];
}

class AppLogoutRequested extends AppEvent {}
