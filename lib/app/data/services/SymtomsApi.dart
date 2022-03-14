
import 'dart:convert';
import 'package:cyanodoc_test/app/data/model/DiagnosisDataModel.dart';

import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:http/http.dart';

var  url =  Uri.parse('https://us-central1-cyanodoc-consult-test.cloudfunctions.net/patientDiagnosis1/symptoms');
late Map<String, dynamic> data;

Future fetchSymptoms() async {
  var client = http.Client();
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();

  print('Response token: $token');
  var response = await client.get(url,
      headers: {
        'Accept': 'application/json',
        'authorization': 'Bearer $token'
      });
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${response.body}');

  if (response.statusCode == 200) {
     //return (jsonDecode(response.body)['diagnosisData']['symptomObjs']);
    Map<String, dynamic> map = json.decode(response.body);
    data = map["diagnosisData"]["symptomObjs"];
    try{
      //Map<String, dynamic>  symptomslist = data ;
      await symptomsBox.write('symptoms', data  );
      print("saved");
    }catch(e){
      print("symptpms api write : $e");
    }


    return data;
  } else {
    print("Failed to Fetch Symptoms");
    throw Exception('Failed to Fetch Symptoms');
  }


}


