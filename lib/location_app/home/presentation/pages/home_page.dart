import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_tracking/location_app/home/presentation/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Center(
        child: ObxValue(
            (location) =>
                Text('lat:${location.value.lat}\nlng:${location.value.lng}'),
            Get.find<HomeController>().currentLocation),
      ),
    );
  }
}
