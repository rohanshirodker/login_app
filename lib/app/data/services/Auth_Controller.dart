import 'package:cyanodoc_test/app/data/model/User_Model.dart';
import 'package:cyanodoc_test/app/data/services/Database.dart';
import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/UserProfile/UserProfileController.dart';
//import 'package:cyanodoc_test/app/data/services/Auth_Service.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthController extends GetxController {
  static AuthController to = Get.find();
  late Rxn<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // User? get user => firebaseUser.value;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rxn<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      // Get.find<UserProfileController>().user =
      //     await Database().getUser(user.uid);
      Get.find<UserProfileController>().userupadte(user.uid);

      Get.offAll(() => HomePage());
    }
  }


  void signIn() async {
    if (emailController.text == "" || passwordController.text == "") {
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
      // UserCredential _authResult =
      await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      // Get.find<UserProfileController>().user =
      //     await Database().getUser(_authResult.user!.uid);

      emailController.clear();
      passwordController.clear();
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
    try {
      await auth.signOut();
      Get.find<UserProfileController>().clear();
    } catch (e) {
      Get.snackbar("Error signing out", e.toString());
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool userverefied() {
    return (FirebaseAuth.instance.currentUser!.emailVerified);
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
