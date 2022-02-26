import 'dart:ui';
import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/data/services/Database.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllness.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPage extends StatelessWidget {
  final SymptomsPageController symptomscontroller = Get.find();
  final SymptomsProvider SymptomsProvidercontroller = Get.find();

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
            padding: const EdgeInsets.all(10.0),
            child: Autocomplete<Map<String, dynamic>>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                List<Map<String, dynamic>> results = [];
                if (textEditingValue.text.isEmpty ||
                    textEditingValue.text.length < 3) {
                  results = []; //SymptomsProvidercontroller.symptoms;
                } else {
                  results = SymptomsProvidercontroller.symptoms
                      .where((element) => element["name"]
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()))
                      .toList();
                }
                return results;
              },
              displayStringForOption: (Map<String, dynamic> symptoms) =>
                  symptoms['name'],
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onEditingComplete: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'search symptoms',
                    suffixIcon: Icon(Icons.search),
                  ),

                  //  onChanged: (String value) async {
                  //    controller.clear();
                  //   // if (value.length < 2) {
                  //   //   return;
                  //   // }
                  // }
                );
              },
              onSelected: (selectedString) {
                // print(selectedString)
                //selectedString.clear();
                return;
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Material(
                  elevation: 10.0,
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> option = options.elementAt(index);
                      return GestureDetector(
                        onTap: () => {
                          symptomscontroller.toggle(option['id']),
                         //Get.to(() => (DiagnosisSummary())),

                          // option.clear(),

                          onSelected(
                            option,
                          ),
                          //  onSelected(symptomscontroller

                          //    .notselectedSymptoms)
                        },
                        child: ListTile(
                          // selected: symptomscontroller.selectedSymptoms
                          //     .contains(symptomscontroller.foundsym.value[index]),
                          // selectedTileColor: Color(0xFFDAE6F7),
                          title: Text(option['name']),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          DisplaySymptoms(),
          ElevatedButton(
              onPressed: () {
                symptomsBox.write(
                    'symptoms', symptomscontroller.selectedSymptoms);
                // symptomscontroller.symFilter("");

                Get.to(() => (DiagnosisSummary()));
              },
              child: Text("Done"),
              style: ElevatedButton.styleFrom(primary: buttoncolor)),
          ElevatedButton(
              onPressed: () {
                // symptomsBox.write(
                //     'symptoms', symptomscontroller.selectedSymptoms);
                // symptomscontroller.symFilter("");

                Get.to(() => (ExistingIllness()));
              },
              child: Text("Existing Illness"),
              style: ElevatedButton.styleFrom(primary: buttoncolor)),
        ],
      ),
    );
  }
}
