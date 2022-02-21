import 'dart:ui';
import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPage extends StatelessWidget {
  final SymptomsPageController symptomscontroller = Get.find();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (value) => symptomscontroller.symFilter(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'search symptoms',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 20),
          SymptomsFilter(),
          ElevatedButton(
              onPressed: () {
                Get.to(() => (DiagnosisSummary()));
              },
              child: Text("Done"),
              style: ElevatedButton.styleFrom(primary: buttoncolor)),
        ],
      ),
    );
  }
}
