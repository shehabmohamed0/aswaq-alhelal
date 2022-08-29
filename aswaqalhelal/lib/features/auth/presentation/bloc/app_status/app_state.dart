part of 'app_bloc.dart';

enum AppStatus { authenticated,authenticatedWithoutAddress, unauthenticated, loading }

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.authenticatedWithoutAddress(User user)
      : this._(status: AppStatus.authenticatedWithoutAddress, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.loading() : this._(status: AppStatus.loading);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
