import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      //   (
      //   title: Text('Symptoms'),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
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
