import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
import 'package:cyanodoc_test/app/modules/ProfilePage/ProfilePage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    // GetPage(
    //   name: '/splashscreen',
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: '/ProfilePage',
      page: () => ProfilePage(),
    ),
    GetPage(
      name: '/LoginPage',
      page: () => LoginPage(),
    ),
    // GetPage(
    //   name: '/register',
    //   page: () => RegisterPage(),
    // ),
    // GetPage(
    //   name: '/todos/:id/edit',
    //   page: () => EditTodo(),
    // ),
    // GetPage(
    //   name: '/add-todo',
    //   page: () => AddTodo(),
    // ),
  ];
}