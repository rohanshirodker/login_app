// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:get/get.dart';
// // import 'package:meta/meta.dart';
// //
// // class LoginPageController extends GetxController {
// //
// //   var status_string = "welcome".obs;
// //
// //   String get result => status_string.value;
// //
// // signInwithPhoneNumber({
// //     required String phone_num,
// //     required FirebaseAuth auth,
// //   })async{
// //     await auth.verifyPhoneNumber(
// //       phoneNumber:phone_num,
// //       verificationCompleted: null,//verificationCompleted,
// //       verificationFailed: (FirebaseException exception ){
// //         status_string.value = "error verifing your phone number ";
// //       },
// //       codeSent: codeSent,
// //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
// //       timeout: null,
// //     );
// //   }
// //
// // }
//
// import 'package:cyanodoc_test/app/data/model/User_Model.dart';
// import 'package:cyanodoc_test/app/data/services/Database.dart';
// import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
// import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
// import 'package:cyanodoc_test/app/modules/LoginPage/LoginnPage1.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../modules/UserProfile/UserProfileController.dart';
// //import 'package:cyanodoc_test/app/data/services/Auth_Service.dart';
//
// FirebaseAuth auth = FirebaseAuth.instance;
//
//
// class AuthController extends GetxController {
//   static AuthController to = Get.find();
//   late Rxn<User> firebaseUser;
//   RxBool isLoggedIn = false.obs;
//
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController verificationController = TextEditingController();
//
//   var statusString = "welcome".obs;
//   var codeSent = "no".obs;
//   var verificationId = "1".obs;
//
//
//   String get statusResult => statusString.value;
//
//   String get codeSentResult => codeSent.value;
//
//   String get verificationIdResult => verificationId.value;
//
//   // User? get user => firebaseUser.value;
//
//   @override
//   void onReady() {
//     super.onReady();
//     firebaseUser = Rxn<User>(auth.currentUser);
//     firebaseUser.bindStream(auth.userChanges());
// //    ever(firebaseUser, _setInitialScreen);
//
//     phoneNumberController = TextEditingController();
//     verificationController = TextEditingController();
//   }
//
//
//   phoneSignIn(//{
//       //required String phoneNum,
//       // required FirebaseAuth auth,
//       // }
//       ) async {
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNumberController.text,
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {
//         statusString.value = "error verifing your phone number ";
//       },
//       codeSent: (String id, int? token) {
//         print('code sent');
//
//         codeSent.value = "yes";
//         verificationId = id as RxString;
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//       timeout: const Duration(seconds: 60),
//     );
//   }
//
//   void checkCredential({required String verID, required String smsCode}) async {
//     AuthCredential authCredential =
//     PhoneAuthProvider.credential(verificationId: verID, smsCode: smsCode);
//
//     await auth
//         .signInWithCredential(authCredential)
//         .then((UserCredential) =>
//     {
//       Get.offAll(() => HomePage())
//     })
//         .catchError((e) {
//       print("error message: $e");
//     });
//   }
//
//
//
//
//   void sigOut() async {
//     try {
//       await auth.signOut();
//       Get.find<UserProfileController>().clear();
//     } catch (e) {
//       Get.snackbar("Error signing out", e.toString());
//     }
//   }
//
//   @override
//   void onClose() {
//     //emailController.dispose();
//    // passwordController.dispose();
//     super.onClose();
//   }
// }