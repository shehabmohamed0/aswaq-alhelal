import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/routes/routes.dart';

import '../../../domain/usecases/needs_a_forced_update.dart';
import '../../../domain/usecases/check_if_seen_before.dart';

part 'start_up_state.dart';

@injectable
class StartUpCubit extends Cubit<StartUpState> {
  StartUpCubit(
    this._needToUpdateTheApp,
    this._checkIfSeenBefore,
  ) : super(StartUpInitial());

  final NeedsAForcedUpdate _needToUpdateTheApp;
  final CheckIfSeenBefore _checkIfSeenBefore;
  Future<void> handleStartUp() async {
    final startUpDelay = Future.delayed(const Duration(milliseconds: 2500));
    final bool needForcedUpdate = await _isAppNeedToUpdate();
    if (needForcedUpdate) {
      emit(StartupNeedToUpdateTheApp());
      return;
    }

    final bool seenBefore = await _seenBefore();
    final routeName = seenBefore ? Routes.landingPage : Routes.onboarding;
    await startUpDelay;
    emit(StartUpFinished(routeName: routeName));
  }

  Future<bool> _isAppNeedToUpdate() async {
    final needUpdateOrFailure =
        await _needToUpdateTheApp(params: NoArgsParams());
    return needUpdateOrFailure.fold(
      (failure) => false,
      (needUpdate) => needUpdate,
    );
  }

  Future<bool> _seenBefore() async {
    final seenBeforeOrFailure =
        await _checkIfSeenBefore(params: NoArgsParams());
    return seenBeforeOrFailure.fold(
      (failure) => true,
      (seenBefore) => seenBefore,
    );
  }
}
