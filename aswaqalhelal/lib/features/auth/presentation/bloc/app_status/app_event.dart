part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppUserChanged extends AppEvent {
  final User user;
  final BaseProfile? profile;
  const AppUserChanged(this.user, [this.profile]);

  @override
  List<Object> get props => [user];
}

class ProfileChanged extends AppEvent {
  final BaseProfile user;
  const ProfileChanged(this.user);

  @override
  List<Object> get props => [user];
}

class AppLogoutRequested extends AppEvent {}
