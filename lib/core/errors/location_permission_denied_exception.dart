import 'package:location_tracking/core/errors/app_exeptions.dart';

class LocationPermissionDeniedException extends AppExceptions {
  LocationPermissionDeniedException() : super(message: 'Permission denied');
}
