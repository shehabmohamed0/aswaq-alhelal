import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'recruitment_state.dart';

@injectable
class RecruitmentCubit extends Cubit<RecruitmentState> {
  RecruitmentCubit() : super(const RecruitmentState());

  void onOpened() {
    emit(const RecruitmentState(bottomSheetOpened: true));
  }

  void onClosed() {
    emit(const RecruitmentState(bottomSheetOpened: false));
  }
}
