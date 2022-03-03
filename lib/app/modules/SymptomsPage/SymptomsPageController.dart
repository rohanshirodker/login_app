import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPageController extends GetxController {
  final SymptomsProvider SymptomsProvidercontroller =
      Get.put(SymptomsProvider());
  var selectedlistlength = 0.obs;
  @override
  void onInit() {

    selectedlistlength.value = selectedSymptoms.length;
    super.onInit();
  }



  get selectedSymptoms => SymptomsProvidercontroller.symptoms
      .where((element) => element["selected"].contains("true"))
      .toList();

  get notselectedSymptoms => SymptomsProvidercontroller.symptoms
      .where((element) => element["selected"].contains("false"))
      .toList();

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
    }

    selectedlistlength.value = selectedSymptoms.length;

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
            itemBuilder: (_, int index) {
              return Card(
                child: ListTile(
                  selected: true,
                  selectedTileColor: Color(0xFFDAE6F7),
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

class searchSymptoms extends StatelessWidget {
  SymptomsPageController symptomscontroller = Get.find();
  final SymptomsProvider SymptomsProvidercontroller =  Get.find();
  var msgController = TextEditingController();
  //Map<String, dynamic> emptyList =[] as Map<String, dynamic>;
  @override
  Widget build(BuildContext context) {
    return //Obx(()
        //{
         // return symptomscontroller.selectedlistlength.value > 0
        //  ?
    Padding(
            padding: const EdgeInsets.all(10.0),
            child: Autocomplete<Map<String, dynamic>>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                List<Map<String, dynamic>> results = [];
                if (textEditingValue.text.isEmpty ||
                    textEditingValue.text.length < 3) {
                  results = [];
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
                  (context, msgController, focusNode, onEditingComplete) {
                return TextField(

                  controller: msgController,

                  focusNode: focusNode,
                  onEditingComplete: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'search symptoms',
                    suffixIcon: IconButton(
                      onPressed:
                      msgController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  // onSubmitted: textEditingValue.clear(),

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
                // msgController.clear();
                //Get.to(() => ( SymptomsPage()));
                //symptomscontroller.selectedlistlengthresult;
                return;// msgController.clear();
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
                          symptomscontroller.toggle(option['id']),
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
         // ):Text("hello");

       // },
    );
  }
}

