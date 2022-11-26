import 'package:aswaqalhelal/core/failures/failure.dart';

class LocationDeniedForeverFailure extends Failure {
  const LocationDeniedForeverFailure(super.message);
}

class LocationDeniedFailure extends Failure {
  const LocationDeniedFailure() : super('');
}
