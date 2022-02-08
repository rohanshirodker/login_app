import 'package:cyanodoc_test/app/core/theme/app_theme.dart';
import 'package:cyanodoc_test/app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/modules/LoginPage/LoginPage.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: "/LoginPage",
      getPages: AppRoutes.routes,
    );
  }
}
