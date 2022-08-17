import 'package:root_package/core/failures/failure.dart';

class LocationDeniedForeverFailure extends Failure {
  final String message;

  LocationDeniedForeverFailure(this.message);
}

class LocationDeniedFailure extends Failure {

  LocationDeniedFailure();
}