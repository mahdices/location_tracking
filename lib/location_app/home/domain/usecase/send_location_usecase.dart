import 'package:location_tracking/location_app/home/data/model/latlng.dart';
import 'package:location_tracking/location_app/home/domain/repository/location_repository.dart';

class SendLocationUsecase{
  final LocationRepository repository;

  SendLocationUsecase({ required this.repository});


  sendLocation(LatLng latLng){
    repository.postLocation(latLng.lat,latLng.lng);
  }
}