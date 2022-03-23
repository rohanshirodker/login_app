import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/data/services/PatientInfoApi.dart';
import 'package:cyanodoc_test/app/data/services/ReportsApi.dart';
import 'package:cyanodoc_test/app/data/services/SymtomsApi.dart';
import 'package:cyanodoc_test/app/modules/ExistingIllness/ExistingIllness.dart';
import 'package:cyanodoc_test/app/modules/ReportsPage/ReportsPageController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map symptomslist = symptomsBox.read('symptoms');
//fetchPatientInfo();
Map symoj = Map();
Map allData = box.read('patientInfo');

class SymptomsPageController extends GetxController {
  final SymptomsProvider SymptomsProvidercontroller =
      Get.put(SymptomsProvider());
  ReportsPageController reportsPageController =
      Get.put(ReportsPageController());
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey autocompleteKey = GlobalKey();
  var selectedlistlength = 0.obs;

  @override
  void onInit() {
    fetchPatientInfo();
    selectedlistlength.value = symptomslist.length;
    symoj['symptomIds'] = symptomslist.keys.toList();

    print('sym1: $symoj');
    super.onInit();
  }




  void addSymtoms(String id, String name) {
    symptomslist.putIfAbsent(
      id,
      () => {
        'id': int.parse(id),
        'type': 'symptoms',
        'isSelected': true,
        'name': name
      }, //addsym(id,name);
    );
    symptomsBox.write('symptoms', symptomslist);
    allData = box.read('patientInfo');
    allData["symptomObjs"] = symptomslist;
    print(allData["symptomObjs"]);
    box.write('patientInfo', allData);

    //box.write(('patientInfo'),{'symptomObjs',symptomslist});
    // print('box ');
    // print(box.read('patientInfo'));
    // print('symptomslist :$symptomslist');
//return;

     selectedlistlength.value = symptomslist.length;
  }

  void deleteSymtoms(String id, String name) {
    symptomslist.remove(id);

    symptomsBox.write('symptoms', symptomslist);
    allData = box.read('patientInfo');
    allData["symptomObjs"] = symptomslist;
    print(allData["symptomObjs"]);
    box.write('patientInfo', allData);
    selectedlistlength.value = symptomslist.length;
  }

  void onSubmitSym() async {
    try {
      await updateDiagnosisData(allData);
      var response = await fetchReports(symoj);
      print('Response report api: ${response.body}');
    } catch (e) {
      print(e);
    }

    symoj['symptomIds'] = symptomslist.keys.toList();
    Get.to(() => (ExistingIllness()));
  }

  searchSymptoms() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RawAutocomplete<Map<String, dynamic>>(
        key: autocompleteKey,
        focusNode: focusNode,
        textEditingController: textEditingController,
        optionsBuilder: (TextEditingValue textEditingValue) async {
          List<Map<String, dynamic>> results = [];
          if (textEditingValue.text.isEmpty ||
              textEditingValue.text.length < 3) {
            results = [];
          } else {
            // List<Map<String, String>> temp = await searchSymptomsApi(textEditingValue.text);

            results = await searchSymptomsApi(textEditingValue.text);
            //temp;

          }
          return results;
        },
        displayStringForOption: (Map<String, dynamic> symptoms) =>
            symptoms['name'],
        fieldViewBuilder:
            (context, _textEditingController, _focusNode, onEditingComplete) {
          return TextField(
            controller: _textEditingController,
            focusNode: _focusNode,
            onEditingComplete: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: 'search symptoms',
              suffixIcon: Icon(Icons.search),
            ),
          );
        },
        onSelected: (selectedString) {
          return textEditingController.clear();
          //  return;
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
                    addSymtoms(option['id'], option['name']),
                    onSelected(option),
                  },
                  child: ListTile(
                    title: Text(option['name']),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DisplaySymptoms extends StatelessWidget {
  SymptomsPageController symptomscontroller = Get.put(SymptomsPageController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: symptomscontroller.selectedlistlength.value,
            //symptomslist.length,
            itemBuilder: (BuildContext context, int index) {
              String key = symptomslist.keys.elementAt(index);
              return Card(
                child: ListTile(
                    trailing:Icon(Icons.close),
                  //selected: true,
                  //selectedTileColor: Color(0xFFDAE6F7),
                          onTap: () => {
                            symptomscontroller.deleteSymtoms(key,symptomslist[key]['name']),
                          },

                  title: Text("${symptomslist[key]['name']}"),
                ),
                // Divider(
                //   height: 2.0,
                // ),
              );
            },
          ),
        ),
      ),
    );
  }
}
