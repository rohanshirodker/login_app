import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/BiometricsPage/BiometricsPageController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricsPage extends StatelessWidget {
  static var biocontroller = Get.put(BiometricsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      //   (
      //   title: Text('Biometrics'),
      //   centerTitle: true,
      // ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(

                controller: biocontroller.AgeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  // errorText: 'Can\'t Be Empty',
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                // initialValue: 'Input text',
                controller: biocontroller.WeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                  helperText: 'kg',
                  //errorText: 'Can\'t Be Empty',
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                //initialValue: 'Input text',
                controller: biocontroller.HeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height',
                  helperText: 'ft',
                  //errorText: 'Can\'t Be Empty',
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  biocontroller.Submit();
                },
                child: Text("Next"),
                  style: ElevatedButton.styleFrom(primary: buttoncolor)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
