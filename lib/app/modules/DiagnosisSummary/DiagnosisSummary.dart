import 'dart:convert';
import 'dart:ui';

import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/services/PatientInfoApi.dart';

import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/services/SymtomsApi.dart';

import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllness.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllnessController.dart';
import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPage.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../BiometricsPage/BiometricsPage.dart';

const TextStyle TStyle = TextStyle(fontSize: 16);
//SymptomsPageController symptomscontroller = Get.find();
ExistingIllnessController ExistingIllnesscontroller = Get.find();

class DiagnosisSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //late List existingillnesslist = (existingillnessBox.read('existingillness'));

    Map symptomslist = symptomsBox.read('symptoms') ?? Map();
    // fetchPatientInfo();
    return WillPopScope(
        onWillPop: () async {
          Get.to(() => (HomePage()));
          return false;
        },
        child: Scaffold(
            backgroundColor: backgroucolor,
            appBar: topAppBar,
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
                          Text("Age : " +  box.read('patientInfo')['patientInfo']['age'],
                              style: TStyle),

                          SizedBox(height: 10),
                          Divider(
                            height: 2.0,
                          ),
                          SizedBox(height: 10),
                          Text("Weight : " +  box.read('patientInfo')['patientInfo']['weight'],//box.read('Weight').toString(),
                              style: TStyle),
                          SizedBox(height: 10),
                          Divider(
                            height: 2.0,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Height : " +  box.read('patientInfo')['patientInfo']['height'],//box.read('Height').toString(),
                            style: TStyle,
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 2.0,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Symptoms",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[200],
                      width: double.infinity,
                      height: 360,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => (SymptomsPage()));
                        },
                        child: ListView.builder(
                          itemCount: symptomslist.length,
                          itemBuilder: (BuildContext context, int index) {
                            String key = symptomslist.keys.elementAt(index);
                            return  Column(
                              children: <Widget>[
                                 ListTile(
                                  title:
                                      Text("${symptomslist[key]['name']}"),
                                  //subtitle: new Text("${data[key]['name']}"),
                                ),
                                 Divider(
                                  height: 2.0,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Existing Diagnosis",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[200],
                      width: double.infinity,
                      height: 360,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => (ExistingIllness()));
                        },
                        child: ListView.builder(
                          itemCount: ExistingIllnesscontroller
                              .selectedExistingIllness.length
                              .toInt(),
                          itemBuilder: (_, int index) {
                            return ListTile(
                              title: Text(
                                  ExistingIllnesscontroller
                                      .selectedExistingIllness[index]['name']
                                      .toString(),
                                  style: TStyle),

                            );

                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
