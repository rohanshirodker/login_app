// import 'dart:convert';
//
// Album AlbumFromJson(String str) => Album.fromJson(json.decode(str));
//
// String AlbumToJson(Album data) => json.encode(data.toJson());
//
// class Album {
//   Album({
//     required this.sucess,
//     required this.diagnosisData,
//   });
//
//   final bool sucess;
//   final DiagnosisData diagnosisData;
//
//   factory Album.fromJson(Map<String, dynamic> json) => Album(
//     sucess: json["sucess"],
//     diagnosisData: DiagnosisData.fromJson(json["diagnosisData"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "sucess": sucess,
//     "diagnosisData": diagnosisData.toJson(),
//   };
// }
//
// class DiagnosisData {
//   DiagnosisData({
//     required this.patientName,
//     required this.age,
//     required this.userId,
//     required this.weight,
//     required this.height,
//   });
//
//   final String? patientName;
//   final int? age;
//   final String? userId;
//   final int? weight;
//   final int? height;
//
//   factory DiagnosisData.fromJson(Map<String, dynamic> json) => DiagnosisData(
//     patientName: json["patientName"],
//     age: json["age"],
//     userId: json["userId"],
//     weight: json["weight"],
//     height: json["height"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "patientName": patientName,
//     "age": age,
//     "userId": userId,
//     "weight": weight,
//     "height": height,
//   };
// }
//
//
//
// // To parse this JSON data, do
// //
// //     final diagnosisData = diagnosisDataFromJson(jsonString);
//
// // import 'package:meta/meta.dart';
// // import 'dart:convert';
// //
// // DiagnosisData diagnosisDataFromJson(String str) => DiagnosisData.fromJson(json.decode(str));
// //
// // String diagnosisDataToJson(DiagnosisData data) => json.encode(data.toJson());
// //
// // class DiagnosisData {
// //   DiagnosisData({
// //     @required this.success,
// //     @required this.diagnosisData,
// //   });
// //
// //   final bool success;
// //   final DiagnosisDataClass diagnosisData;
// //
// //   factory DiagnosisData.fromJson(Map<String, dynamic> json) => DiagnosisData(
// //     success: json["success"],
// //     diagnosisData: DiagnosisDataClass.fromJson(json["diagnosisData"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "success": success,
// //     "diagnosisData": diagnosisData.toJson(),
// //   };
// // }
//
// class DiagnosisDataClass {
//   DiagnosisDataClass({
//     required this.userId,
//     required this.patientInfo,
//   });
//
//   final String userId;
//   final PatientInfo patientInfo;
//
//   factory DiagnosisDataClass.fromJson(Map<String, dynamic> json) => DiagnosisDataClass(
//     userId: json["userId"],
//     patientInfo: PatientInfo.fromJson(json["patientInfo"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "patientInfo": patientInfo.toJson(),
//   };
// }
//
// class PatientInfo {
//   PatientInfo({
//     required this.age,
//     required this.weight,
//     required this.height,
//     required this.patientName,
//   });
//
//   final String age;
//   final String weight;
//   final String height;
//   final String patientName;
//
//   factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
//     age: json["age"],
//     weight: json["weight"],
//     height: json["height"],
//     patientName: json["patientName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "age": age,
//     "weight": weight,
//     "height": height,
//     "patientName": patientName,
//   };
// }
