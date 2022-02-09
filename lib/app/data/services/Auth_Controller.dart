import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
import 'package:cyanodoc_test/app/modules/ProfilePage/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Service.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rxn<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rxn<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    email = TextEditingController();
    password = TextEditingController();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => ProfilePage());
    }
  }

  void signIn() async {
    if (email.text == "" || password.text == "") {
      Get.snackbar(
        "Error",
        "Empty email or password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      return;
    }
    // Get.snackbar(
    //   "Signing In",
    //   "Loading",
    //   showProgressIndicator: true,
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.white,
    // );
    try {
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      email.clear();
      password.clear();
    } catch (e) {
      Get.back();
      Get.snackbar(
        "sign In Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }

  void sigOut() async {
    auth.signOut();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}

// handleSignUp() async {
//   if (emailController.text == "" || passwordController.text == "") {
//     Get.snackbar(
//       "Error",
//       "Empty email or password",
//     );
//     return;
//   }
//
//   Get.snackbar("Signing Up", "Loading",
//       showProgressIndicator: true,
//       snackPosition: SnackPosition.BOTTOM,
//       duration: Duration(minutes: 2));
//   try {
//     await _authService.signUp(
//         emailController.text.trim(), passwordController.text.trim());
//     emailController.clear();
//     passwordController.clear();
//   } catch (e) {
//     Get.back();
//     Get.defaultDialog(title: "Error", middleText: e.message, actions: [
//       MaterialButton(
//         onPressed: () {
//           Get.back();
//         },
//         child: Text("Close"),
//       ),
//     ]);
//     print(e);
//   }
// }
// }
