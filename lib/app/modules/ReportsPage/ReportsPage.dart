import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/model/ReportsModel.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/ReportsPage/ReportsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsPage extends GetWidget<AuthController> {
  ReportsPageController ReportsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thyroid Profile Report',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DisplayReports(),


            SizedBox(
              height: 10,
            ),

            ElevatedButton(
                onPressed: () {
                  // Get.to(() => (ReportPage()));
                },
                child: Text("Proceed"),
                style: ElevatedButton.styleFrom(primary: buttoncolor)),

          ],

        ),
      ),
    );
  }
}

