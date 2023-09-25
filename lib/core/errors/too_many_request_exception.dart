import 'package:location_tracking/core/errors/app_exeptions.dart';

class TooManyRequestException extends AppExceptions {
  TooManyRequestException() : super(message: 'Too many request');
}
