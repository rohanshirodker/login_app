
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

  final Map<String, dynamic> symptoms = {
   '1':{"id": '1', "name": "Headache", "selected": "false"},
    '2': {"id": '2', "name": "Stomach ach", "selected": "false"},
    '3': {"id": '3', "name": "Hair loss", "selected": "false"},
    '4': {"id": '4', "name": "Cool skin", "selected": "false"},
    '5': {"id": '5', "name": "Excessive Sweating", "selected": "false"},
    '6': {"id": '6', "name": "Forgetfulness ,memory loss", "selected": "false"},
  };


  //
  // ////fetching data
  // var result = box.read('symapi');
  // dynamic jsonData = jsonDecode(result);
  // List symptomslist = jsonData.map((SymptomObjs) => SymptomObjs.fromJson(jsonData)).toList().obs;


@override

  void onInit()async {
  //fetchAlbum();

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


