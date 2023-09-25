import 'package:get/instance_manager.dart';
import 'package:location_tracking/data/datasource/login_datasource.dart';
import 'package:location_tracking/data/repository/user_repository_impl.dart';
import 'package:location_tracking/domain/usecase/login_user_usecase.dart';
import 'package:location_tracking/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final datasource = LoginDatasourceImpl();
    final repository = UserRepositoryImpl(datasource: datasource);
    final useCase = LoginUserUseCase(repository: repository);
    Get.lazyPut<LoginController>(
        () => LoginController(loginUserUseCase: useCase));
  }
}
