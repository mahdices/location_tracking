import 'package:get/get.dart';
import 'package:location_tracking/core/controller/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }
}
