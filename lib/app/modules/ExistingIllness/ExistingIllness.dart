import 'dart:ui';
import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/provider/ExistingIllnessProvider.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllnessController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExistingIllness extends StatelessWidget {
  final ExistingIllnessProvider ExistingIllnessProvidercontroller = Get.find();
  final ExistingIllnessController ExistingIllnesscontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Select any pre existing diagnosis",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ExistingIllnessFilter(),
          ElevatedButton(
              onPressed: () {
                existingillnessBox.write('existingillness',
                    ExistingIllnesscontroller.selectedExistingIllness);
                Get.to(() => (DiagnosisSummary()));
              },
              child: Text("Done"),
              style: ElevatedButton.styleFrom(primary: buttoncolor)),
        ],
      ),
    );
  }
}
