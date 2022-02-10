import 'package:cyanodoc_test/app/data/services/signin_enum.dart';
import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
import 'package:cyanodoc_test/app/modules/ProfilePage/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Service.dart';
//import 'package:cyanodoc_test/app/routes/routes.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  RxBool isLogged = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService _authService = AuthService();
  Rxn<User> user = Rxn<User>();

  AuthController() {
    _authService = AuthService();
  }

  @override
  void onInit() async {
    print("onInit");

    ever(isLogged, handleAuthChanged);
    user.value = await _authService.getCurrentUser();
    isLogged.value = user.value != null;
    _authService.onAuthChanged().listen((event) {
      isLogged.value = event != null;
      print("listen");
      user.value = event;
    });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  handleAuthChanged(isLoggedIn) {
    if (isLoggedIn == false) {
      print("failed");
      Get.offAllNamed("/login");
    } else {
      print("profilepage");
      Get.offAllNamed("/ProfilePage");
    }
  }

  handleSignIn(SignInType type) async {
    if (type == SignInType.EMAIL_PASSWORD) {
      if (emailController.text == "" || passwordController.text == "") {
        Get.snackbar(
          "Error",
          "Empty email or password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
        );
        return;
      }
    }

    // Get.snackbar("Signing In", "Loading",
    //     showProgressIndicator: true,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.white
    //duration: Duration(minutes: 2)
    // );
    try {
      if (type == SignInType.EMAIL_PASSWORD) {
        await _authService.signInWithEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim());
        //  emailController.clear();
        // passwordController.clear();
      }
      // if (type == SignInType.GOOGLE) {
      //   await _authService.signInWithGoogle();
      // }
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "Error", middleText: e.toString(), actions: [
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Close"),
        ),
      ]);
      print(e);
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
  //       FlatButton(
  //         onPressed: () {
  //           Get.back();
  //         },
  //         child: Text("Close"),
  //       ),
  //     ]);
  //     print(e);
  //   }
  // }

  handleSignOut() {
    _authService.signOut();
  }
}
