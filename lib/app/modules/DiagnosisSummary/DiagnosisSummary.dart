import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DiagnosisSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diagnosis Summary'),centerTitle: true,),
      body: Container(
        // child: GetX<MyController>(
        //     init: MyController(),
        //     builder: (_) {
        //       return Container();
        //     }),
      ),
    );
  }
}
