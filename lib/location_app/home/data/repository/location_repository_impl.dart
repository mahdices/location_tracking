import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:location_tracking/location_app/home/domain/repository/location_repository.dart';

class LocationRepositoryImpl extends GetConnect implements LocationRepository {
  final String token;
  LocationRepositoryImpl(this.token);

  @override
  void onInit() {
    super.onInit();
    httpClient.addAuthenticator<dynamic>((request) async{
      request.headers['Authorization'] = token;
      return request;
    });
  }

  @override
  Future<void> postLocation(double lat, double lng) async{
    await post(
        'https://04ac3fef-cf59-45a3-bdc2-247edd0988d3.mock.pstmn.io/user/location',
        {
          'lat': lat.toString(),
          'lang': lng.toString(),
        });

  }


}
