import 'package:root_package/core/failures/failure.dart';

class UserNotFoundFailure extends Failure {
  final String message;

  UserNotFoundFailure(this.message);
}



class AlreadySendOfferFailure extends Failure {
  final String message;

  AlreadySendOfferFailure(this.message);
}



