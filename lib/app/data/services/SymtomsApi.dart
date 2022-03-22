import 'dart:convert';
import 'package:cyanodoc_test/app/data/model/DiagnosisDataModel.dart';

import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:http/http.dart';

var url = Uri.parse(
    'https://us-central1-cyanodoc-consult-test.cloudfunctions.net/patientDiagnosis1');
var urlsearch = Uri.parse(
    'https://us-central1-cyanodoc-consult-test.cloudfunctions.net/symptoms?q=hair&type=symptoms');


late Map<String, dynamic> data;
//late  List<Map<String, dynamic>>  sdata;

Future fetchSymptoms() async {
  var client = http.Client();
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();

  print('Response token: $token');
  var response = await client.get(url, headers: {
    'Accept': 'application/json',
    'authorization': 'Bearer $token'
  });
  //print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    //return (jsonDecode(response.body)['diagnosisData']['symptomObjs']);
    Map<String, dynamic> map = json.decode(response.body);
    data = map["diagnosisData"]["symptomObjs"];
    try {
      //Map<String, dynamic>  symptomslist = data ;
      await symptomsBox.write('symptoms', data);
      print("saved");
    } catch (e) {
      print("symptpms api write : $e");
    }

    return data;
  } else {
    print("Failed to Fetch Symptoms");
    throw Exception('Failed to Fetch Symptoms');
  }
}

Future addSymptoms(String id, String name) async {
  var client = http.Client();
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();

  print('Response token: $token');
  return await client.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'Bearer $token'
    },
    //body: SymptomObj.toJson(),
    body: jsonEncode(SymptomObj),
  );
}


Future<List<Map<String, String>>> searchSymptomsApi(String query) async {
  // var client = http.Client();
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();
  var queryParameters = {
    'q': query,
    'type': 'symptoms',
  };
  var uri = Uri.https('us-central1-cyanodoc-consult-test.cloudfunctions.net',
      '/symptoms', queryParameters);
  print("url created " + uri.toString());
  //print('Response token: $token');
  var response = await http.get(uri, headers: {
    'Accept': 'application/json',
    'authorization': 'Bearer $token'
  });
  //print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  List<Symptom> Symptoms = [];
  if (response.statusCode == 200) {
    //return (jsonDecode(response.body)['symptoms']) ;
    Iterable json = jsonDecode(response.body)['symptoms'];
    Symptoms = List<Symptom>.from(json.map((model) => Symptom.fromJson(model)));

    print('Number of suggestion: ${Symptoms.length}.');
    return Future.value(
        Symptoms.map((e) => {'name': e.name, 'id': e.id.toString()}).toList());
  } else {
    print("Failed to Fetch Symptoms");
    throw Exception('Failed to Fetch Symptoms');
  }
}
