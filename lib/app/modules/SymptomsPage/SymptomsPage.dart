import 'dart:ui';
import 'package:cyanodoc_test/app/core/values/colors.dart';
//import 'package:cyanodoc_test/app/data/provider/Api_Provider.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/data/services/SymtomsApi.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllness.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPage extends StatelessWidget {
  final SymptomsPageController symptomscontroller = Get.find();
  final SymptomsProvider SymptomsProvidercontroller = Get.find();


  Map temp = {"2": {
  "isSelected": true,
  "type": "symptoms",
  "id": 2,
  "name": "Breast development in men"}};

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

          symptomscontroller.searchSymptoms(),

         DisplaySymptoms(),



          ElevatedButton(
              onPressed: () async{
                // symptomsBox.write(
                //     'symptoms', symptomscontroller.selectedSymptoms);
                //
                //  Get.to(() => (MyApp1()));
                //Get.to(() => (ExistingIllness()));
                //var resp = await searchSymptomsApi("hair") ;

              //  await addSymptoms(temp);
              //  symptomscontroller.addsym();
                symptomscontroller.post();

              //  await addSymptoms("7", "Cool ");0


               // print(resp);
              },
              child: Text("Next"),
              style: ElevatedButton.styleFrom(primary: buttoncolor)),
        ],

      ),

    );
  }
}


