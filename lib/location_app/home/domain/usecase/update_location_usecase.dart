import 'package:location_tracking/core/errors/location_permission_denied_exception.dart';
import 'package:location_tracking/core/errors/location_service_disabled_exception.dart';
import 'package:location_tracking/location_app/home/data/model/latlng.dart';
import 'package:location_tracking/location_app/home/domain/repository/gps_repository.dart';

class UpdateLocationUsecase {
  GpsRepository repository;
  UpdateLocationUsecase({
    required this.repository,
  });

  Future<LatLng> getLocation() async {
    await prepare();
    return repository.getLocation();
  }

  Stream<LatLng> getLocationUpdate() async* {
    await prepare();
    yield* repository.getLocationUpdate();
  }

  Future<bool> requestEnableService() {
    return repository.requestEnableService();
  }

  Future<bool> requestPermission() {
    return repository.requestPermission();
  }

  Future<void> prepare() async {
    await _checkServiceEnabled();
    await _checkPermissionGranted();
  }

  Future<bool> _checkServiceEnabled() async {
    final enabled = await repository.isServiceEnabled();
    if (!enabled) {
      throw LocationServiceDisabledException();
    }
    return enabled;
  }

  Future<bool> _checkPermissionGranted() async {
    final granted = await repository.isPermissionGranted();
    if (!granted) {
      throw LocationPermissionDeniedException();
    }
    return granted;
  }
}
