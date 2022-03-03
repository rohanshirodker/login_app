import 'dart:ui';
import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllness.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPage extends StatelessWidget {
  final SymptomsPageController symptomscontroller = Get.find();
  final SymptomsProvider SymptomsProvidercontroller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("list of symptoms",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),

          searchSymptoms(),

          DisplaySymptoms(),

          ElevatedButton(
              onPressed: () {
                symptomsBox.write(
                    'symptoms', symptomscontroller.selectedSymptoms);
                Get.to(() => (ExistingIllness()));
              },
              child: Text("Next"),
              style: ElevatedButton.styleFrom(primary: buttoncolor)),
        ],
      ),
    );
  }
}

// void txtclear(TextEditingController msgController) {
//   msgController.clear();
//   //msgController.dispose();
//   print("clearded");
// }
