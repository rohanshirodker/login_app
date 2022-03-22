
import 'dart:convert';


import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/services/SymtomsApi.dart';
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



//void fetchAlbum() async {
  //var sym =await remoteServices.fetchAlbum();
//   if(sym != null){
//     symptomsapilist.value= sym as List<SymptomsData> ;
//   }
// }

  final List<Map<String, dynamic>> symptoms = [
   {"id": '1', "name": "Headache", "selected": "false"},
     {"id": '2', "name": "Stomach ach", "selected": "false"},
     {"id": '3', "name": "Hair loss", "selected": "false"},
     {"id": '4', "name": "Cool skin", "selected": "false"},
     {"id": '5', "name": "Excessive Sweating", "selected": "false"},
     {"id": '6', "name": "Forgetfulness ,memory loss", "selected": "false"},
  ] ;


  //
  // ////fetching data
  // var result = box.read('symapi');
  // dynamic jsonData = jsonDecode(result);
  // List symptomslist = jsonData.map((SymptomObjs) => SymptomObjs.fromJson(jsonData)).toList().obs;


@override

  void onInit()async {
  //fetchAlbum();
  fetchSymptoms();
 try{
   Map<String, dynamic> symptomslist  = (symptomsBox.read('symptoms'));

   if (symptomslist.isEmpty)
     {fetchSymptoms();}

   //Map<String, dynamic> symptomslist = fetchSymptoms() as Map<String, dynamic> ;//(symptomsBox.read('symptoms'));//
  //restore(symptomslist ,symptoms);

  print('restored symptoms');
}catch(e){
  print("symptpms provider : $e");
  }
    super.onInit();
  }


}


class Symptom {
  Symptom({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class SymptomObj {
  SymptomObj({
    required this.isSelected,
    required this.type,
    required this.id,
    required this.name,
  });

  final bool isSelected;
  final String type;
  final int id;
  final String name;

  factory SymptomObj.fromJson(Map<String, dynamic> json) => SymptomObj(
    isSelected: json["isSelected"],
    type: json["type"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "isSelected": isSelected,
    "type": type,
    "id": id,
    "name": name,
  };
}

