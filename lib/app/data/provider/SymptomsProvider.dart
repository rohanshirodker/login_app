
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