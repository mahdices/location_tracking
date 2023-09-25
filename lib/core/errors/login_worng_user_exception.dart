import 'package:location_tracking/core/errors/app_exeptions.dart';

class LoginWrongUserException extends AppExceptions {
  LoginWrongUserException()
      : super(message: 'Wrong password provided for that user.');
}
