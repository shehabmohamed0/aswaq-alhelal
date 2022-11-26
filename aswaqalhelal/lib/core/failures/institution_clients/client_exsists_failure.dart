import '../failure.dart';

class ClientExsistsBeforeFailure extends Failure {
  final String message;

  ClientExsistsBeforeFailure(this.message);
}
