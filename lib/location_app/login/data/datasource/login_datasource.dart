import 'package:firebase_auth/firebase_auth.dart';
import 'package:location_tracking/core/errors/app_exeptions.dart';
import 'package:location_tracking/core/errors/login_worng_password_exception.dart';
import 'package:location_tracking/core/errors/login_worng_user_exception.dart';
import 'package:location_tracking/core/errors/too_many_request_exception.dart';

abstract class LoginDatasource {
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class LoginDatasourceImpl extends LoginDatasource {
  @override
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await result.user?.getIdToken() ?? '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw LoginWrongUserException();
      } else if (e.code == 'wrong-password') {
        throw LoginWrongPasswordException();
      } else if (e.code == 'too-many-requests') {
        throw TooManyRequestException();
      } else {
        throw AppExceptions(message: e.code);
      }
    }
  }
}
