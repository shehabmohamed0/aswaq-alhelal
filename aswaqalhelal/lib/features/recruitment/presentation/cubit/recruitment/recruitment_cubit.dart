import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/injectable.dart';

part 'recruitment_state.dart';

@injectable
class RecruitmentCubit extends Cubit<RecruitmentState> {
  RecruitmentCubit() : super(const RecruitmentState());

  void onOpened() {
    emit(const RecruitmentState(bottomSheetOpened: true));
  }

  void onClosed( ) {
    emit(const RecruitmentState(bottomSheetOpened: false));
  }
}
