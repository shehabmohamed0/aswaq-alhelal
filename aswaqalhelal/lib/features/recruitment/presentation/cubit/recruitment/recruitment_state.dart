part of 'recruitment_cubit.dart';

class RecruitmentState extends Equatable {
  final bool bottomSheetOpened;
  const RecruitmentState({
    this.bottomSheetOpened = false,
  });
  @override
  List<Object?> get props => [bottomSheetOpened];
}
