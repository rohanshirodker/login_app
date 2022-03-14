// import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SymptomsPageController extends GetxController {
//   final SymptomsProvider SymptomsProvidercontroller =
//       Get.put(SymptomsProvider());
//   final TextEditingController textEditingController =  TextEditingController();
//   final FocusNode focusNode = FocusNode();
//   final GlobalKey autocompleteKey = GlobalKey();
//   var selectedlistlength = 0.obs;
//
//   @override
//   void onInit() {
//     selectedlistlength.value = selectedSymptoms.length;
//     super.onInit();
//   }
//
//   get selectedSymptoms => SymptomsProvidercontroller.symptoms
//       .where((element) => element["selected"].contains("true"))
//       .toList();
//
//   get notselectedSymptoms => SymptomsProvidercontroller.symptoms
//       .where((element) => element["selected"].contains("false"))
//       .toList();
//
//   void toggle(String id) {
//     // print(id);
//     for (int i = 0; i < SymptomsProvidercontroller.symptoms.length; i++) {
//       if (SymptomsProvidercontroller.symptoms[i]['id'] == id) {
//         if (SymptomsProvidercontroller.symptoms[i]['selected'] == "true") {
//           SymptomsProvidercontroller.symptoms[i]['selected'] = "false";
//         } else {
//           SymptomsProvidercontroller.symptoms[i]['selected'] = "true";
//         }
//       }
//     }
//
//     selectedlistlength.value = selectedSymptoms.length;
//   }
//
//   searchSymptoms() {
//
//       return
//           Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: RawAutocomplete<Map<String, dynamic>>(
//           key: autocompleteKey,
//           focusNode: focusNode,
//           textEditingController: textEditingController,
//           optionsBuilder: (TextEditingValue textEditingValue) {
//             List<Map<String, dynamic>> results = [];
//             if (textEditingValue.text.isEmpty ||
//                 textEditingValue.text.length < 3) {
//               results = [];
//             } else {
//               results = SymptomsProvidercontroller.symptoms
//                   .where((element) => element["name"]
//                       .toString()
//                       .toLowerCase()
//                       .contains(textEditingValue.text.toLowerCase()))
//                   .toList();
//             }
//             return results;
//           },
//           displayStringForOption: (Map<String, dynamic> symptoms) =>
//               symptoms['name'],
//           fieldViewBuilder:
//               (context, _textEditingController, _focusNode, onEditingComplete) {
//             return TextField(
//               controller: _textEditingController,
//               focusNode: _focusNode,
//               onEditingComplete: null,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 labelText: 'search symptoms',
//                 suffixIcon:  Icon(Icons.search),
//
//               ),
//             );
//           },
//           onSelected: (selectedString) {
//
//             return  textEditingController.clear();
//             //  return;
//           },
//           optionsViewBuilder: (context, onSelected, options) {
//             return Material(
//               elevation: 10.0,
//               child: ListView.builder(
//                 padding: EdgeInsets.all(10.0),
//                 itemCount: options.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Map<String, dynamic> option = options.elementAt(index);
//                   return GestureDetector(
//                     onTap: () => {
//                       toggle(option['id']),
//                       onSelected(option),
//                     },
//                     child: ListTile(
//                       title: Text(option['name']),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       );
//   }
// }
//
// class DisplaySymptoms extends StatelessWidget {
//   SymptomsPageController symptomscontroller = Get.put(SymptomsPageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Obx(
//         () => Container(
//           padding: EdgeInsets.all(10),
//           child: ListView.builder(
//             itemCount: symptomscontroller.selectedlistlength.value,
//             itemBuilder: (_, int index) {
//               return Card(
//                 child: ListTile(
//                   selected: true,
//                   selectedTileColor: Color(0xFFDAE6F7),
//                   onTap: () => {
//                     symptomscontroller.toggle(
//                         symptomscontroller.selectedSymptoms[index]['id']),
//                   },
//                   title:
//                       Text(symptomscontroller.selectedSymptoms[index]['name']),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
