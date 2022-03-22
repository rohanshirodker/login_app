// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  Report({
    required this.success,
    required this.reports,
  });

  final String success;
  final List<ReportElement> reports;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    success: json["success"],
    reports: List<ReportElement>.from(json["reports"].map((x) => ReportElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "reports": List<dynamic>.from(reports.map((x) => x.toJson())),
  };
}

class ReportElement {
  ReportElement({
    required this.id,
    required this.name,
    required this.tests,
  });

  final int id;
  final String name;
  final List<Test> tests;

  factory ReportElement.fromJson(Map<String, dynamic> json) => ReportElement(
    id: json["id"],
    name: json["name"],
    tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
  };
}

class Test {
  Test({
    required this.id,
    required this.name,
    required this.category,
    required this.question,
    required this.values,
  });

  final int id;
  final String name;
  final String category;
  final String question;
  final List<String> values;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    question: json["question"],
    values: List<String>.from(json["values"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "question": question,
    "values": List<dynamic>.from(values.map((x) => x)),
  };
}
