import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPageController extends GetxController {
  final SymptomsProvider SymptomsProvidercontroller = Get.put(SymptomsProvider());

  Rx<List<Map<String, dynamic>>> foundsym = Rx<List<Map<String, dynamic>>>([]);

//List tempsymp=symptomsBox.read('symptoms');

  @override
  void onInit() {
    super.onInit();
    foundsym.value = SymptomsProvidercontroller.symptoms;

  }

  get selectedSymptoms => SymptomsProvidercontroller.symptoms
      .where((element) => element["selected"].contains("true"))
      .toList();




  void symFilter(String EnteredSym) {
    List<Map<String, dynamic>> results = [];
    if (EnteredSym.isEmpty) {
      results = SymptomsProvidercontroller.symptoms;
    } else {
      results = SymptomsProvidercontroller.symptoms
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(EnteredSym.toLowerCase()))
          .toList();

    }
    foundsym.value = results;


  }

  void toggle(int index) {
    if (foundsym.value[index]['selected'] == "true") {
      foundsym.value[index]['selected'] = "false";
    } else {
      foundsym.value[index]['selected'] = "true";
    }
    foundsym.refresh();
  }
}

class SymptomsFilter extends StatelessWidget {
  SymptomsPageController symptomscontroller = Get.put(SymptomsPageController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: symptomscontroller.foundsym.value.length,
            itemBuilder: (_, int index) {
              return Card(
                child: ListTile(
                  selected: symptomscontroller.selectedSymptoms
                      .contains(symptomscontroller.foundsym.value[index]),
                  selectedTileColor: Color(0xFFDAE6F7),
                  //onChanged: (bool? selected),
                  onTap: () => {
                    symptomscontroller.toggle(index),
                  },

                  title: Text(symptomscontroller.foundsym.value[index]['name']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}
