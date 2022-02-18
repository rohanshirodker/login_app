import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BiometricsPageController extends GetxController {
  final TextEditingController AgeController =
  TextEditingController(text: box.read('Age'));
  final TextEditingController WeightController =
  TextEditingController(text: box.read('Weight'));
  final TextEditingController HeightController =
  TextEditingController(text: box.read('Height'));


  void Submit() {
    if (AgeController.text != "" &&
        WeightController.text != "" &&
        HeightController.text != "") {
      box.write('Age', AgeController.text);
      box.write('Weight', WeightController.text);
      box.write('Height', HeightController.text);
      Get.snackbar(
        "Age,Weight,Height",
        "Update Successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      Get.to(() => (SymptomsPage()));
      //Database().updateusername(_updateusername.text, _uid);
      //Get.find<UserProfileController>().userupadte(_uid);
      //AgeController.clear();
    } else {
      Get.snackbar(
        "Age,Weight,Height",
        "Update Failed: Fields Cannot Be Empty ",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }


@override
void dispose() {
  // Clean up the controller when the widget is disposed.
  AgeController.dispose();
  WeightController.dispose();
  HeightController.dispose();
  super.dispose();
}
}
