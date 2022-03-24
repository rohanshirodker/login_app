import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

var  tokenurl =  Uri.parse('https://us-central1-cyanodoc-consult-test.cloudfunctions.net/agoraRtcToken');



Future fetchToken(Map list) async {
  var token = await FirebaseAuth.instance.currentUser!.getIdToken();
  // print('Response token: $token');
  var response= await http.post(
    tokenurl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'Bearer $token'
    },
    //body: SymptomObj.toJson(),
    body: jsonEncode(list),
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return response;
}