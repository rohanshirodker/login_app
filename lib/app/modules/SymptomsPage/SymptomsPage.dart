import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms'),
        centerTitle: true,
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () async {
            Get.to(() => (DiagnosisSummary()));
          },
          child: Text("Done"),
        ),
      ),
    );
  }
}
