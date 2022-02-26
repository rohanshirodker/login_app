import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPageController extends GetxController {
  final SymptomsProvider SymptomsProvidercontroller =
      Get.put(SymptomsProvider());

  //Rx<List<Map<String, dynamic>>> selectedSymptoms= Rx<List<Map<String, dynamic>>>([]);

//List tempsymp=symptomsBox.read('symptoms');

  // @override
  // void onInit() {
  //   super.onInit();
  //     // selectedSymptoms = symptomsBox.read('symptoms');
  //       // .where((element) => element["selected"].contains("true"))
  //       // .toList();
  //  // selectedSymptoms = symptomsBox.read('symptoms');
  //   // void sym(String EnteredSym) {
  //   //   List<Map<String, dynamic>> results = [];
  //   //   if (EnteredSym.isEmpty) {
  //   //     results = SymptomsProvidercontroller.symptoms;
  //   //   } else {
  //   //     results = SymptomsProvidercontroller.symptoms
  //   //         .where((element) => element["name"]
  //   //             .toString()
  //   //             .toLowerCase()
  //   //             .contains(EnteredSym.toLowerCase()))
  //   //         .toList();
  //   //   }
  //   //   return results;
  //   //   //foundsym.value = results;
  //   // }
  //
  //  // foundsym.value = SymptomsProvidercontroller.symptoms;
  // }

  get selectedSymptoms => SymptomsProvidercontroller.symptoms
      .where((element) => element["selected"].contains("true"))
      .toList();

  get notselectedSymptoms => SymptomsProvidercontroller.symptoms
      .where((element) => element["selected"].contains("false"))
      .toList();

  // List symFilter(String EnteredSym) {
  //   List<Map<String, dynamic>> results = [];
  //   if (EnteredSym.isEmpty) {
  //     results = SymptomsProvidercontroller.symptoms;
  //   } else {
  //     results = SymptomsProvidercontroller.symptoms
  //         .where((element) => element["name"]
  //             .toString()
  //             .toLowerCase()
  //             .contains(EnteredSym.toLowerCase()))
  //         .toList();
  //   }
  //   return results;
  //   //foundsym.value = results;
  // }

  void toggle(String id) {
    // print(id);
    for (int i = 0; i < SymptomsProvidercontroller.symptoms.length; i++) {
      if (SymptomsProvidercontroller.symptoms[i]['id'] == id) {
        if (SymptomsProvidercontroller.symptoms[i]['selected'] == "true") {
          SymptomsProvidercontroller.symptoms[i]['selected'] = "false";
        } else {
          SymptomsProvidercontroller.symptoms[i]['selected'] = "true";
        }
      }
      // else{
      //   print('toggel element not founf');
      // }
      // selectedSymptoms.refresh();
      // return;
    }
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
            itemCount: symptomscontroller.selectedSymptoms.length,
            itemBuilder: (_, int index) {
              return Card(
                child: ListTile(
                  selected: true,
                  // symptomscontroller.selectedSymptoms,
                  // .contains(symptomscontroller.foundsym.value[index]),
                  //selectedTileColor: Color(0xFFDAE6F7),
                  //onChanged: (bool? selected),
                  onTap: () => {
                    symptomscontroller.toggle(
                        symptomscontroller.selectedSymptoms[index]['id']),
                  },

                  title:
                      Text(symptomscontroller.selectedSymptoms[index]['name']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
