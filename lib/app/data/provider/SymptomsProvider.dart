
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:get/get.dart';
// class SymptomsData {
//   final int? id;
//   final String? name;
//
// //  final bool? selected ;
//   SymptomsData(
//       { required this.id, required this.name}); //,required this.selected,});
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       // "selected":selected,
//     };
//   }
//
//
//
// }
class SymptomsProvider extends GetxController {

  final List<Map<String, dynamic>> symptoms = [
    {"id": '1', "name": "Headache", "selected": "false"},
    {"id": '2', "name": "Stomach ach", "selected": "false"},
    {"id": '3', "name": "Hair loss", "selected": "false"},
    {"id": '4', "name": "Cool skin", "selected": "false"},
    {"id": '5', "name": "Excessive Sweating", "selected": "false"},
    {"id": '6', "name": "Forgetfulness ,memory loss", "selected": "false"},
  ].obs;


@override
  void onInit() {
 try{ List symptomslist = (symptomsBox.read('symptoms'));
  restore(symptomslist ,symptoms);

  print('restored symptoms');
}catch(e){
  print(e);
  }
    super.onInit();
  }


}


//
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// void main() => runApp(const AutocompleteExampleApp());
//
// class AutocompleteExampleApp extends StatelessWidget {
//   const AutocompleteExampleApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: RawAutocompleteSplit(),
//     );
//   }
// }
//
// const List<String> _options = <String>[
//   'aardvark',
//   'bobcat',
//   'chameleon',
// ];

// class RawAutocompleteSplit extends StatefulWidget {
//   const RawAutocompleteSplit({Key? key}) : super(key: key);
//
//   @override
//   RawAutocompleteSplitState createState() => RawAutocompleteSplitState();
// }
//
// class RawAutocompleteSplitState extends State<RawAutocompleteSplit> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // This is where the real field is being built.
//         title: TextFormField(
//           controller: _textEditingController,
//           focusNode: _focusNode,
//           decoration: const InputDecoration(
//             hintText: 'Split RawAutocomplete App',
//           ),
//           onFieldSubmitted: (String value) {
//             RawAutocomplete.onFieldSubmitted<String>(_autocompleteKey);
//           },
//         ),
//       ),
//       body: Align(
//         alignment: Alignment.topLeft,
//         child: RawAutocomplete<String>(
//           key: _autocompleteKey,
//           focusNode: _focusNode,
//           textEditingController: _textEditingController,
//           optionsBuilder: (TextEditingValue textEditingValue) {
//             return _options.where((String option) {
//               return option.contains(textEditingValue.text.toLowerCase());
//             }).toList();
//           },
//           optionsViewBuilder: (BuildContext context,
//               AutocompleteOnSelected<String> onSelected,
//               Iterable<String> options) {
//             return Material(
//               elevation: 4.0,
//               child: ListView(
//                 children: options
//                     .map((String option) => GestureDetector(
//                   onTap: () {
//                     onSelected(option);
//                   },
//                   child: ListTile(
//                     title: Text(option),
//                   ),
//                 ))
//                     .toList(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }