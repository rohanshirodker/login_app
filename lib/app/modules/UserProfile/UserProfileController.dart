import 'package:cyanodoc_test/app/data/model/User_Model.dart';
import 'package:cyanodoc_test/app/data/services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }

  void userupadte(String _uid) async {
    user = await Database().getUser(_uid);
  }

  Future sendVerificationEmail() async {
    try {
      final user1 = FirebaseAuth.instance.currentUser!;
      await user1.sendEmailVerification();
    } catch (e) {
      Get.snackbar(
        "Email Verification Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }
}
