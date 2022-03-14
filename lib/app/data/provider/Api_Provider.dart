//
// import 'dart:convert';
// import 'package:cyanodoc_test/app/data/model/DiagnosisDataModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:meta/meta.dart';
// import 'package:http/http.dart';
//
//  var  url =  Uri.parse('https://us-central1-cyanodoc-consult-test.cloudfunctions.net/patientDiagnosis1');
//
// Future<DiagnosisData> fetchAlbum() async {
//   var client = http.Client();
//   var token = await FirebaseAuth.instance.currentUser!.getIdToken();
//
//   print('Response token: $token');
//   var response = await client.get(url,
//       headers: {
//         'Accept': 'application/json',
//         'authorization': 'Bearer $token'
//       });
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//
//   if (response.statusCode == 200) {
//     return DiagnosisData.fromJson(jsonDecode(response.body)['diagnosisData']);
//   } else {
//     print("Failed to load album");
//     throw Exception('Failed to load album');
//   }
//
//
// }
//
//
