import 'package:location_tracking/core/errors/app_exeptions.dart';

class LoginWrongPasswordException extends AppExceptions {
  LoginWrongPasswordException()
      : super(message: 'No user found for that email.');
}
