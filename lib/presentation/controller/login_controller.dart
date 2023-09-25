import 'package:get/state_manager.dart';

import 'package:location_tracking/domain/usecase/login_user_usecase.dart';
import 'package:location_tracking/presentation/controller/base_controller.dart';

class LoginController extends BaseController {
  final email = ''.obs;
  final password = ''.obs;
  final LoginUserUseCase loginUserUseCase;
  LoginController({
    required this.loginUserUseCase,
  });

  login() {
    setLoadingState(true);
    loginUserUseCase
        .login(email: email.value, password: password.value)
        .then((value) => null)
        .onError((error, stackTrace) => null)
        .whenComplete(() => setLoadingState(false));
  }
}
