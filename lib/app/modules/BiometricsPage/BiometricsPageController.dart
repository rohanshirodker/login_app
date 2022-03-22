import 'package:cyanodoc_test/app/data/services/PatientInfoApi.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/services/Database.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPage.dart';
import 'package:cyanodoc_test/app/modules/UserProfile/UserProfileController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// late Map info= box.read('patientInfo');
class BiometricsPageController extends GetxController {
  @override
  void onInit() async{
    await fetchPatientInfo();
  //   Map patientInfo;
  //   //patientInfo = box.read('patientInfo');
  //  // if(patientInfo.isEmpty)
  //     patientInfo = await fetchPatientInfo();
  //     box.write('patientInfo', patientInfo);
  //     print(patientInfo);
  //   super.onInit();
   }

  //final UserProfileController controller = Get.find();
  final TextEditingController AgeController =
  TextEditingController(text:  box.read('patientInfo')['patientInfo']['age']);

  final TextEditingController WeightController =
  TextEditingController(text: box.read('patientInfo')['patientInfo']['weight']);//box.read('Weight'));
  final TextEditingController HeightController =
  TextEditingController(text: box.read('patientInfo')['patientInfo']['height']);//box.read('Height'));


  void Submit() async{
    if (AgeController.text != "" &&
        WeightController.text != "" &&
        HeightController.text != "") {
      Map temp =box.read('patientInfo');
      temp['patientInfo']['age']= AgeController.text;
      temp['patientInfo']['weight']= WeightController.text;
      temp['patientInfo']['height']= WeightController.text;
      print('bio temp : $temp');
      box.write('patientInfo',temp);
      try {
        await upadteBio(temp);
      }catch(e)
    {
      print(e);
    }
      // Get.snackbar(
      //   "Age,Weight,Height",
      //   "Update Successful",
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.white,
      // );
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
