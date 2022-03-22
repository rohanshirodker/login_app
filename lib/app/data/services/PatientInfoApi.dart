
import 'dart:convert';
import 'package:cyanodoc_test/app/data/model/DiagnosisDataModel.dart';
import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:http/http.dart';

 var  url =  Uri.parse('https://us-central1-cyanodoc-consult-test.cloudfunctions.net/patientDiagnosis1');


Future fetchPatientInfo() async {
  var client = http.Client();
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();

  print('Response token: $token');
  var response = await client.get(url,
      headers: {
        'Accept': 'application/json',
        'authorization': 'Bearer $token'
      });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    Map info = (jsonDecode(response.body)['diagnosisData']);//['patientInfo']);
    box.write('patientInfo',info );
    print("patient info: ");
    print(info);
    return info;
  } else {
    print("Failed to load album");
    throw Exception('Failed to load album');
  }
}



Future upadteBio(Map bio) async {
  var client = http.Client();
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();

 // print('Response token: $token');
  return await client.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'Bearer $token'
    },
    //body: SymptomObj.toJson(),
    body: jsonEncode(bio),
  );
}



class PatientInfo {
  PatientInfo({
    required this.height,
    required this.gender,
    required this.patientName,
    required this.weight,
    required this.age,
  });

  final String height;
  final String gender;
  final String patientName;
  final String weight;
  final String age;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    height: json["height"],
    gender: json["gender"],
    patientName: json["patientName"],
    weight: json["weight"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "gender": gender,
    "patientName": patientName,
    "weight": weight,
    "age": age,
  };
}

