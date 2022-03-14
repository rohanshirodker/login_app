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
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController verificationController = TextEditingController();

  var statusString = "welcome".obs;
  var codeSent = "no".obs;
  var verificationId = "";

  String get statusResult => statusString.value;

  String get codeSentResult => codeSent.value;

  String get verificationIdResult => verificationId;

  User? get user => firebaseUser.value;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rxn<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    phoneNumberController = TextEditingController();
    verificationController = TextEditingController();
  }

  void sigOut() async {
    try {
      await auth.signOut();
      codeSent.value = "no";
      //Get.find<UserProfileController>().clear();
      Get.offAll(() => LoginPage());
    } catch (e) {
      Get.snackbar("Error signing out", e.toString());
    }
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      // Get.find<UserProfileController>().user =
      //     await Database().getUser(user.uid);
     // Get.find<UserProfileController>().userupadte(user.uid);
      Get.offAll(() => HomePage());
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    verificationController.dispose();
    super.onClose();
  }

  bool userverefied() {
    return (FirebaseAuth.instance.currentUser!.emailVerified);
  }

  phoneSignIn() async {
    if (phoneNumberController.text == "") {
      Get.snackbar(
        "Error",
        "Phone Number Cannot Be Empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      return;
    }
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        print('logged in');
      },
      verificationFailed: (FirebaseAuthException e) {
       Get.snackbar(
          "Sign In Failed",
          e.code.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          //duration: Duration(seconds: 5),
        );
        statusString.value = "error verifying your phone number ";
      },
      codeSent: (String id, int? token) {
        print('code sent');

        codeSent.value = "yes";
        verificationId = id;
      },
      codeAutoRetrievalTimeout: (String Id) {
        verificationId = Id;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  void checkCredential({required String verID, required String smsCode}) async {
    AuthCredential authCredential =
        PhoneAuthProvider.credential(verificationId: verID, smsCode: smsCode);
    await auth
        .signInWithCredential(authCredential)
        .then((UserCredential) => {
              Get.offAll(() => HomePage()),
        phoneNumberController.clear(),
        verificationController.clear(),
              // Get.find<UserProfileController>().user =
              // await Database().getUser(UserCredential.user!.uid)
            })
        .catchError((e) {
      Get.back();
      Get.snackbar(
        "Sign In Failed",
        e.code.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    });
  }
}
