import 'dart:convert';

import 'package:cyanodoc_test/app/data/model/ReportsModel.dart';
import 'package:cyanodoc_test/app/data/services/ReportsApi.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

//Map repoprtlist = Map();
 List repoprtlist=[] ;
class ReportsPageController extends GetxController {
  // Map reportResult= Map();

@override
void onInit()async {

  var response = await fetchReports(symoj);
   repoprtlist = jsonDecode(response.body)['reports'];
  //Iterable json = jsonDecode(response.body)['reports'];
  //repoprtlist=List<ReportElement>.from(json.map((model) => ReportElement.fromJson(model)));
}


   fun() async {
     var response = await fetchReports(symoj);
    // print('Response body: ${response.body}');
    // List<ReportElement> Reports = [];
     // if (response.statusCode == 200) {
     //return (jsonDecode(response.body)['symptoms']) ;
   // Iterable json = jsonDecode(response.body)['reports'];
    //repoprtlist = List<ReportElement>.from(json.map((model) => ReportElement.fromJson(model)));
     repoprtlist = jsonDecode(response.body)['reports'];
     print(repoprtlist);

  }
}

class Questions extends StatelessWidget {
  Questions(
      {required this.text,
      required this.dropdownValue,
      required this.NormalValue});

  final Text text;
  late final String dropdownValue;
  final List<String> NormalValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          label: text,
          // labelText: 'What range dose the value of T3 lie?',
          labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),

      value: dropdownValue,
      hint: const Text('Select'),
      icon: const Icon(Icons.arrow_drop_down),
      //  elevation: 16,

      onChanged: (String? newValue) {
        dropdownValue = newValue!;
      },
      items: NormalValue.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//
// Future<Iterable<Map<String, String>>> RepostsApi() async {
//   var response = await fetchReports(symoj);
//   print('Response body: ${response.body}');
//   List<ReportElement> Reports = [];
//  // if (response.statusCode == 200) {
//     //return (jsonDecode(response.body)['symptoms']) ;
//     Iterable json = jsonDecode(response.body)['reports'];
//   Reports = List<ReportElement>.from(json.map((model) => ReportElement.fromJson(model)));
//   //Report reportFromJson(String str) => Report.fromJson(json.decode(str));
//  // print(Reports.length);
//
//
//
// //return Reports;
//   //  print('Number of suggestion: ${Symptoms.length}.');
//      return
//       Future.value(
//         Reports.map((e) => {'name': e.name,}).toList());
//   // } else {
//   //   print("Failed to Fetch Symptoms");
//   //   throw Exception('Failed to Fetch Symptoms');
//   // }
// }

class DisplayReports extends StatelessWidget {
 // SymptomsPageController symptomscontroller = Get.put(SymptomsPageController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child:  Container(
          padding: EdgeInsets.all(10),
          child:
          ListView.builder(
            itemCount: repoprtlist.length,// symptomscontroller.selectedlistlength.value,//symptomslist.length,
            itemBuilder: (BuildContext context, int index) {
              //String key = symptomslist.keys.elementAt(index);
              return  Card(
                child:
                ListTile(

                  // selected: true,
                  // selectedTileColor: Color(0xFFDAE6F7),
                  //         onTap: () => {
                  //           symptomscontroller.toggle(
                  //               symptomscontroller.selectedSymptoms[index]['id']),
                  //         },

                  title:
                  Text("${repoprtlist[index]['name']}"),
                  subtitle: Text("${repoprtlist[index]['tests']}"),


                ),
                // Divider(
                //   height: 2.0,
                // ),

              );
            },
          ),
        ),

    );
  }
}
