import 'package:cyanodoc_test/app/modules/BiometricsPage/BiometricsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricsPage extends StatelessWidget {
  static var biocontroller = Get.put(BiometricsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometrics'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                // initialValue: 'Input text',
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
                    borderRadius: new BorderRadius.circular(25.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
