import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;
  AppBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AppState.loading()) {
    _userSubscription = _authRepository.user.listen((user) {
      add(AppUserChanged(user));
    });
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }
  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isEmpty
          ? const AppState.unauthenticated()
          : event.user.address != null
              ? AppState.authenticated(event.user)
              : AppState.authenticatedWithoutAddress(event.user),
    );
  }

  void _onLogoutRequested(
      AppLogoutRequested event, Emitter<AppState> emit) async {
    await _authRepository.signOut();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
