import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:location_tracking/core/controller/app_controller.dart';
import 'package:location_tracking/location_app/home/data/repository/gps_repository_impl.dart';
import 'package:location_tracking/location_app/home/data/repository/location_repository_impl.dart';
import 'package:location_tracking/location_app/home/domain/usecase/send_location_usecase.dart';
import 'package:location_tracking/location_app/home/domain/usecase/update_location_usecase.dart';
import 'package:location_tracking/location_app/home/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final repository = GpsRepositoryImpl(Location());
    final usecase = UpdateLocationUsecase(repository: repository);
    final locationRepository = LocationRepositoryImpl(Get.find<AppController>().token);
    final sendLocationUsecase = SendLocationUsecase(repository: locationRepository);
    Get.lazyPut(() => HomeController(usecase: usecase,sendLocationUsecase: sendLocationUsecase));
  }
}
