import 'package:cyanodoc_test/app/data/model/User_Model.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
 Map userProfile= Map().obs;
 void onInit()async {
   userProfile=  await box.read('patientInfo');
   //print('user profie page : ');
  // print(userProfile['patientInfo']['patientName']);
 }
    var UserName = "0".obs ;
 String username(){
   return (userProfile['patientInfo']['patientName']);

 }
 String useremail(){
   return (userProfile['patientInfo']['email']);
 }
 String usernumber(){
   return (userProfile['patientInfo']['phone']['number']);
 }

void  updateusername(String newName){
  UserName =newName as RxString;
  userProfile['patientInfo']['patientName']= newName;
}

 //  String UserEmail = "".obs as String;
 // String UserNumber = "";

 //UserName = userProfile['patientInfo']['patientName'];

 // Rx<UserModel> _userModel = UserModel().obs;

  //UserModel get user => _userModel.value;

 // set user(UserModel value) => this._userModel.value = value;

  // void clear() {
  //   _userModel.value = UserModel();
  // }
  //
  // void userupadte(String _uid) async {
  //   user = await Database().getUser(_uid);
  // }

//   Future sendVerificationEmail() async {
//     try {
//       final user1 = FirebaseAuth.instance.currentUser!;
//       await user1.sendEmailVerification();
//     } catch (e) {
//       Get.snackbar(
//         "Email Verification Failed",
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.white,
//       );
//     }
//   }
 }
