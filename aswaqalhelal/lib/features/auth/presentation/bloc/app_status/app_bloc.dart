import 'dart:async';
import 'dart:developer';

import 'package:aswaqalhelal/core/utils/logs.dart';
import 'package:aswaqalhelal/features/auth/domain/entities/user_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/user/user_model.dart';
import '../../../domain/entities/base_profile.dart';
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
    _userSubscription = _authRepository.user.listen((user) async {
      log('emit user');
      final profileOrFailure = await _authRepository.getLastProfile();
      final profile = profileOrFailure.fold((failure) {
        return null;
      }, (profile) {
        return profile;
      });
      log(user.profiles.toString());

      add(AppUserChanged(user, profile));
    });

    on<AppUserChanged>(_onUserChanged);
    on<ProfileChanged>(_onUserProfileChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }
  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    //No logged in user
    if (event.user.isEmpty) {
      emit(const AppState.unauthenticated());
      return;
    }

    final userProfile = event.user.profiles
        .firstWhere((element) => element.isUser) as UserProfile;
    if (userProfile.address == null || userProfile.name.isEmpty) {
      emit(AppState.authenticatedWithoutAddress(event.user));
      return;
    }

    if (event.profile == null) {
      emit(AppState.authenticated(event.user, event.user.profiles.first));
      return;
    }
    final profiles = event.user.profiles;
    final profile =
        profiles.firstWhere((element) => element.id == event.profile!.id);

    emit(AppState.authenticated(event.user, profile));
  }

  FutureOr<void> _onUserProfileChanged(
      ProfileChanged event, Emitter<AppState> emit) async {
    await _userSubscription.cancel();
    _userSubscription = _authRepository.user.listen((userProfile) {
      add(AppUserChanged(userProfile));
    });
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
