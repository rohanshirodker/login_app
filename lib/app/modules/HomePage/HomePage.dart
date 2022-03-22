import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/modules/ReportsPage/ReportsPage.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../UserProfile/UserProfile.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      body: Container(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => (DiagnosisSummary()));
                    },
                    child: Text("Diagnosis Summary"),
                    style: ElevatedButton.styleFrom(primary: buttoncolor)),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => (UserProfile()));
                    },
                    child: Text("user profile"),
                    style: ElevatedButton.styleFrom(primary: buttoncolor)),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => (ReportsPage()));
                    },
                    child: Text("Report Page"),
                    style: ElevatedButton.styleFrom(primary: buttoncolor)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
