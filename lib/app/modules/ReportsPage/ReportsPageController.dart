import 'dart:convert';
import 'dart:developer';

import 'package:cyanodoc_test/app/data/model/ReportsModel.dart';
import 'package:cyanodoc_test/app/data/services/ReportsApi.dart';
import 'package:cyanodoc_test/app/modules/SymptomsPage/SymptomsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Report reports = Report(
  success: '400',
  reports: [],
);


class ReportsPageController extends GetxController {
  @override
  void onInit() async {
    var response = await fetchReports(symoj);

    reports = Report.fromJson(jsonDecode(response.body));
    update();
  }
}

class DisplayReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: reports.reports.length,
          itemBuilder: (BuildContext context, int index) {
            //String key = symptomslist.keys.elementAt(index);
            return getReportColumn(reports.reports[index]);
          },
        ),
      ),
    );
  }
}

Column getReportColumn(ReportElement report) {
  log("reportName: " + report.name);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        report.name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 15,
      ),
      for (var test in report.tests) getSubTest(test),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Column getSubTest(Test subtest) {
  log("subtest: " + subtest.values.toString());
  String? dropdownValue;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
            label: Text(
              subtest.question,
              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // labelText: 'What range dose the value of T3 lie?',
            labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),

        value: dropdownValue,
        // hint: const Text('Select'),
        icon: const Icon(Icons.arrow_drop_down),
        //  elevation: 16,

        onChanged: (String? newValue) {
          dropdownValue = newValue!;
        },
        items: subtest.values.map((String val) {
          return DropdownMenuItem<String>(
            child: Text(val),
            value: val,
          );
        }).toList(),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
