import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:location_tracking/core/controller/app_controller.dart';
import 'package:location_tracking/core/errors/app_exeptions.dart';

import 'package:location_tracking/domain/usecase/login_user_usecase.dart';
import 'package:location_tracking/presentation/controller/base_controller.dart';

class LoginController extends BaseController {
  final email = ''.obs;
  final password = ''.obs;
  final LoginUserUseCase loginUserUseCase;
  LoginController({
    required this.loginUserUseCase,
  });

  login() async {
    try {
      setLoadingState(true);
      final result = await loginUserUseCase.login(
          email: email.value, password: password.value);
      Get.find<AppController>().token = result;
    } catch (e) {
      if (e is AppExceptions) {
        Get.snackbar('Error', e.message);
      }
    } finally {
      setLoadingState(false);
    }
  }
}
