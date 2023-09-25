import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:location_tracking/location_app/login/presentation/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => Get.find<LoginController>().email = value,
          ),
          TextField(
            onChanged: (value) => Get.find<LoginController>().password = value,
          ),
          ElevatedButton(
              onPressed: () {
                Get.find<LoginController>().login();
              },
              child: ObxValue(
                  (loading) => loading.value
                      ? CircularProgressIndicator()
                      : Text('Login'),
                  Get.find<LoginController>().isLoading))
        ],
      ),
    );
  }
}
