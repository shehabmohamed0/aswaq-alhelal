import 'package:formz/formz.dart';

extension StatusExtension on FormzStatus {
  bool isButtonInvalid() {
    return isSubmissionInProgress || isInvalid || isPure;
  }

  bool get isButtonValid {
    return isValid ||
        isSubmissionSuccess ||
        isSubmissionFailure ||
        isSubmissionCanceled;
  }
}
