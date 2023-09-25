import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:location_tracking/presentation/controller/binding/login_binding.dart';
import 'package:location_tracking/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyCUZeqhcSL5LXRxrYJ9N6udjJ1pym2H4dg',
    appId: '1:93823949501:android:90180decf49cf15c84b5d4',
    messagingSenderId: '93823949501',
    projectId: 'flutter-test-fedc0',
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
      ],
    );
  }
}
