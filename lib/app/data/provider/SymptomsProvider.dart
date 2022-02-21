
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
    {"id": '4', "name": "Headache2", "selected": "false"},
    {"id": '5', "name": "Stomach ach2", "selected": "false"},
    {"id": '6', "name": "Hair loss2", "selected": "false"},
  ].obs;
}