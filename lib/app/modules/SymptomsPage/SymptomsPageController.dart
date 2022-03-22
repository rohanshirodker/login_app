import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/data/services/ReportsApi.dart';
import 'package:cyanodoc_test/app/data/services/SymtomsApi.dart';
import 'package:cyanodoc_test/app/modules/ReportsPage/ReportsPageController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map symptomslist = symptomsBox.read('symptoms');
//fetchPatientInfo();
Map symoj= Map();

class SymptomsPageController extends GetxController {
  final SymptomsProvider SymptomsProvidercontroller =
      Get.put(SymptomsProvider());
  ReportsPageController reportsPageController =  Get.put(ReportsPageController());
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey autocompleteKey = GlobalKey();
  var selectedlistlength = 0.obs;

 // symptomIds : [ id1, id2 ...]

  @override
  void onInit() {
    selectedlistlength.value = symptomslist.length;
//var   sym1 =symptomslist.keys;
// symoj= symptomIds [ sym1 ];
//    "reports": {}

    symoj['symptomIds'] = symptomslist.keys.toList();
    //symoj['reports']= temp;
    print('sym1: $symoj');
    super.onInit();
  }
  void post()async {
try{var response =
await fetchReports(symoj);
print('Response report api: ${response.body}');
//reportsPageController.reportResult = response.body;

}catch(e){
  print(e);
}

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
 void addsym() {
    SymptomObj(

       isSelected: true,
       type: "symptoms",
       id: 2,
       name: "Breast development in men").toJson();
 }

  searchSymptoms()  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RawAutocomplete<Map<String, String>>(
        key: autocompleteKey,
        focusNode: focusNode,
        textEditingController: textEditingController,
        optionsBuilder: (TextEditingValue textEditingValue) async {
          List<Map<String, String>> results = [];
          if (textEditingValue.text.isEmpty ||
              textEditingValue.text.length < 3) {
            results = [];
          } else {
           // List<Map<String, String>> temp = await searchSymptomsApi(textEditingValue.text);

            results =  await searchSymptomsApi(textEditingValue.text);
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
                    // toggle(option['id']),
                    //onSelected(option),
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
          child:
          ListView.builder(
            itemCount: symptomscontroller.selectedlistlength.value,//symptomslist.length,
            itemBuilder: (BuildContext context, int index) {
              String key = symptomslist.keys.elementAt(index);
              return  Card(
                child:
                  ListTile(

                    selected: true,
                     selectedTileColor: Color(0xFFDAE6F7),
                    //         onTap: () => {
                    //           symptomscontroller.toggle(
                    //               symptomscontroller.selectedSymptoms[index]['id']),
                    //         },

                    title:
                    Text("${symptomslist[key]['name']}"),

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
