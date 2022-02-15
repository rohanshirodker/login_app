import 'package:cyanodoc_test/app/core/theme/AppTheme.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
import 'package:cyanodoc_test/app/modules/UserProfile/UserProfileController.dart';
import 'package:cyanodoc_test/app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/modules/LoginPage/LoginPage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(UserProfileController());
  Get.put(AuthController());
  runApp(MyApp());
 // runApp(HomePage());
}

class MyApp extends StatelessWidget {

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
