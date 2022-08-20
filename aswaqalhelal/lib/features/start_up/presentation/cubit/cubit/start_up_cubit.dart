import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../domain/usecases/check_if_seen_before.dart';

part 'start_up_state.dart';

@injectable
class StartUpCubit extends Cubit<StartUpState> {
  StartUpCubit(this._checkIfSeenBefore) : super(StartUpInitial());

  final CheckIfSeenBefore _checkIfSeenBefore;

  Future<void> handleStartUp() async {
    final startUpDelay = Future.delayed(const Duration(milliseconds: 2500));
    final seenBeforeOrFailure =
        await _checkIfSeenBefore(params: NoArgsParams());
    final seenBefore =
        seenBeforeOrFailure.fold((failure) => true, (seenBefore) => seenBefore);
    final state = seenBefore ? StartUpHomePage() : StartUpOnboarding();

    await startUpDelay;
    emit(state);
  }
}
