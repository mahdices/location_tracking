import 'dart:async';

import 'package:get/get.dart';
import 'package:location_tracking/core/controller/base_controller.dart';
import 'package:location_tracking/core/errors/location_permission_denied_exception.dart';
import 'package:location_tracking/core/errors/location_service_disabled_exception.dart';
import 'package:location_tracking/location_app/home/data/model/latlng.dart';
import 'package:location_tracking/location_app/home/domain/usecase/send_location_usecase.dart';
import 'package:location_tracking/location_app/home/domain/usecase/update_location_usecase.dart';

class HomeController extends BaseController {
  UpdateLocationUsecase usecase;
  SendLocationUsecase sendLocationUsecase;
  Timer? _timer;
  Rx<LatLng> currentLocation = Rx(LatLng(lat: 0, lng: 0));

  HomeController({
    required this.usecase,
    required this.sendLocationUsecase,
  });


  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  getLocation() async {
    try {
      currentLocation.value = await usecase.getLocation();
      currentLocation.bindStream(usecase.getLocationUpdate());
      _startSendingLocation();
    } on LocationServiceDisabledException catch (e) {
      Get.snackbar('Error', e.message);
      final enabled = await usecase.requestEnableService();
      if (enabled) getLocation();
    } on LocationPermissionDeniedException catch (e) {
      Get.snackbar('Error', e.message);
      final granted = await usecase.requestPermission();
      if (granted) getLocation();
    }
  }

  void _startSendingLocation() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      sendLocationUsecase.sendLocation(currentLocation.value);
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
