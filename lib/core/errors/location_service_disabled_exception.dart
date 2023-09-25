import 'package:location_tracking/core/errors/app_exeptions.dart';

class LocationServiceDisabledException extends AppExceptions {
  LocationServiceDisabledException() : super(message: 'Location is off');
}
