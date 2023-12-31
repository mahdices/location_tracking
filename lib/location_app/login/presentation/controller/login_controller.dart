import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:location_tracking/core/controller/app_controller.dart';
import 'package:location_tracking/core/errors/app_exeptions.dart';
import 'package:location_tracking/location_app/login/domain/usecase/login_user_usecase.dart';
import 'package:location_tracking/core/controller/base_controller.dart';

class LoginController extends BaseController {
  var email = '';
  var password = '';
  final LoginUserUseCase loginUserUseCase;
  LoginController({
    required this.loginUserUseCase,
  });

  login() async {
    try {
      setLoadingState(true);
      final result =
          await loginUserUseCase.login(email: email, password: password);
      Get.find<AppController>().token = result;
      Get.offAndToNamed('/home');
    } catch (e) {
      if (e is AppExceptions) {
        Get.snackbar('Error', e.message);
      }
    } finally {
      setLoadingState(false);
    }
  }
}
