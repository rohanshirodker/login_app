import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    // GetPage(
    //   name: '/splashscreen',
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: '/DiagnosisSummary',
      page: () => DiagnosisSummary(),
    ),
    GetPage(
      name: '/LoginPage',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/HomePage',
      page: () => HomePage(),
    ),
    // GetPage(
    //   name: '/ProfilePage',
    //   page: () => ProfilePage(),
    // ),



  ];
}
