
import 'package:cyanodoc_test/app/data/provider/ExistingIllnessProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExistingIllnessController extends GetxController {
  final ExistingIllnessProvider ExistingIllnessProvidercontroller =
  Get.put(ExistingIllnessProvider());

  //Rx<List<Map<String, dynamic>>> foundsym = Rx<List<Map<String, dynamic>>>([]);

//List tempsymp=symptomsBox.read('symptoms');

  // @override
  // void onInit() {
  //   super.onInit();
  //   // foundsym.value = SymptomsProvidercontroller.symptoms;
  // }

  get selectedExistingIllness => ExistingIllnessProvidercontroller.existingillness
      .where((element) => element["selected"].contains("true"))
      .toList();
  get existingillnessdata => ExistingIllnessProvidercontroller.existingillness;

  // get notselectedSymptoms => SymptomsProvidercontroller.symptoms
  //     .where((element) => element["selected"].contains("false"))
  //     .toList();

  // List symFilter(String EnteredSym) {
  //   List<Map<String, dynamic>> results = [];
  //   if (EnteredSym.isEmpty) {
  //     results = SymptomsProvidercontroller.symptoms;
  //   } else {
  //     results = SymptomsProvidercontroller.symptoms
  //         .where((element) => element["name"]
  //         .toString()
  //         .toLowerCase()
  //         .contains(EnteredSym.toLowerCase()))
  //         .toList();
  //   }
  //   return results;
  //   foundsym.value = results;
  // }

  void toggle(String id) {

    for(int i =0 ; i< existingillnessdata.length ; i++ ){
      if(existingillnessdata[i]['id'] == id){
        if (existingillnessdata[i]['selected'] == "true") {
          existingillnessdata[i]['selected'] = "false";
        } else {
          existingillnessdata[i]['selected'] = "true";
        }
        }
      }
    existingillnessdata.refresh();
    }



}

class ExistingIllnessFilter extends StatelessWidget {
  ExistingIllnessController ExistingIllnesscontroller = Get.put(ExistingIllnessController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
            () => Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: ExistingIllnesscontroller.existingillnessdata.length,
            itemBuilder: (_, int index) {
              return Card(
                child: ListTile(
                  selected: ExistingIllnesscontroller.selectedExistingIllness
                      .contains(ExistingIllnesscontroller.existingillnessdata[index]),
                  selectedTileColor: Color(0xFFDAE6F7),
                  //onChanged: (bool? selected),
                  onTap: () => {
                    ExistingIllnesscontroller.toggle(ExistingIllnesscontroller.existingillnessdata[index]['id']),
                  },

                  title: Text(ExistingIllnesscontroller.existingillnessdata[index]['name']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
