import 'dart:ui';

import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPage.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BiometricsPage/BiometricsPage.dart';

const TextStyle TStyle = TextStyle(fontSize: 16);

class DiagnosisSummary extends StatelessWidget {

  //GetWidget<DiagnosisSummaryController>
  //final SymptomsPageController symptomscontroller = Get.find();

  @override
  Widget build(BuildContext context) {

    //Get.put(SymptomsPageController());
    final SymptomsPageController symptomscontroller = Get.find();
    return WillPopScope(
        onWillPop: () async {
      Get.to(() => (HomePage()));
          return false;
        },
    child: Scaffold(
        backgroundColor: backgroucolor,
        appBar: topAppBar,
        //(
        // title: Text('Diagnosis Summary'),
        // centerTitle: true,
        // ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    Get.to(() => (BiometricsPage()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Age : " + box.read('Age').toString(),
                          style: TStyle),
                      SizedBox(height: 20),
                      Text("Weight : " + box.read('Weight').toString(),
                          style: TStyle),
                      SizedBox(height: 20),
                      Text(
                        "Height : " + box.read('Height').toString(),
                        style: TStyle,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text("Symptoms",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.grey[200],
                width: double.infinity,
                height: 360,
                child: InkWell(
                  onTap: () {
                    Get.to(() => (SymptomsPage()));
                  },
                  child: ListView.builder(
                    itemCount: symptomscontroller.selectedSymptoms.length,
                    itemBuilder: (_, int index) {
                      return ListTile(
                        title: Text(
                            symptomscontroller.symptomsdata[index].name,
                            style: TStyle),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
