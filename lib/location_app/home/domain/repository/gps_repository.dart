import 'package:location_tracking/location_app/home/data/model/latlng.dart';

abstract class GpsRepository {
  Future<LatLng> getLocation();
  Stream<LatLng> getLocationUpdate();
  Future<bool> isServiceEnabled();
  Future<bool> isPermissionGranted();
  Future<bool> requestEnableService();
  Future<bool> requestPermission();
}
