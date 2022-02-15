import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BiometricsPage/BiometricsPage.dart';

class DiagnosisSummary extends StatelessWidget {
  //GetWidget<DiagnosisSummaryController>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Diagnosis Summary'),
          centerTitle: true,
        ),
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 25),
                      Text("Weight : " + box.read('Weight').toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 25),
                      Text("Height : " + box.read('Height').toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => (SymptomsPage()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Text("Symptoms")
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold)),
                        // SizedBox(height: 25),
                        // Text("Weight : " + box.read('Weight'),
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold)),
                        // SizedBox(height: 25),
                        // Text("Height : " + box.read('Height'),
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold)),
                        // SizedBox(height: 25),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
