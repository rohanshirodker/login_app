import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/model/ReportsModel.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/ReportsPage/ReportsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle Qtext = const TextStyle(fontSize: 20, color: Colors.black);
Text text = Text(
    "very very vrey verty very very vrey verty very very vrey verty",
    maxLines: 2);

TextStyle HeadingText =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
var NormalValue = ["Below Normal", "Normal", "Above Normal"];
var YesNoValue = ["Yes", "No"];

class ReportsPage extends GetWidget<AuthController> {
  ReportsPageController ReportsController = Get.find();


  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

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

            // Text('What range dose the value of T3 lie?',),

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

