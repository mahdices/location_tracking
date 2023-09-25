import 'package:location_tracking/location_app/home/data/model/latlng.dart';
import 'package:location_tracking/location_app/home/domain/repository/gps_repository.dart';
import 'package:location/location.dart';

class GpsRepositoryImpl implements GpsRepository {
  final Location location;
  GpsRepositoryImpl(this.location);
  @override
  Future<LatLng> getLocation() async {
    final result = await location.getLocation();
    return LatLng(lat: result.latitude ?? 0, lng: result.longitude ?? 0);
  }

  @override
  Stream<LatLng> getLocationUpdate() {
    final result = location.onLocationChanged;
    return result.map(
        (event) => LatLng(lat: event.latitude ?? 0, lng: event.longitude ?? 0));
  }

  @override
  Future<bool> isPermissionGranted() async {
    return (await location.hasPermission()) == PermissionStatus.granted;
  }

  @override
  Future<bool> isServiceEnabled() async {
    return await location.serviceEnabled();
  }

  @override
  Future<bool> requestEnableService() async {
    return location.requestService();
  }

  @override
  Future<bool> requestPermission() async {
    return (await location.requestPermission()) == PermissionStatus.granted;
  }
}
