part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  authenticatedWithoutAddress,
  unauthenticated,
  loading
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = UserModel.empty,
    this.profile = BaseProfile.empty,
  });

  const AppState.authenticated(User user, BaseProfile profile)
      : this._(status: AppStatus.authenticated, user: user, profile: profile);

  const AppState.authenticatedWithoutAddress(User user)
      : this._(status: AppStatus.authenticatedWithoutAddress, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.loading() : this._(status: AppStatus.loading);

  final User user;
  final BaseProfile profile;
  final AppStatus status;
  
  const AppState({
    required this.user,
    required this.profile,
    required this.status,
  });

  AppState copyWith({
    User? user,
    BaseProfile? profile,
    AppStatus? status,
  }) {
    return AppState(
      user: user ?? this.user,
      profile: profile ?? this.profile,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [user, profile, status];
}
