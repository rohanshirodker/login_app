import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/model/ReportsModel.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/ReportsPage/ReportsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle Qtext = const TextStyle(fontSize: 20, color: Colors.black);
Text text = Text(
    "very very vrey verty very very vrey verty very very vrey verty",
    maxLines: 2);

TextStyle HeadingText =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
var NormalValue = ["Below Normal", "Normal", "Above Normal"];
var YesNoValue = ["Yes", "No"];

class ReportsPage extends GetWidget<AuthController> {
  ReportsPageController ReportsController = Get.find();


  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thyroid Profile Report',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DisplayReports(),

            // Text('What range dose the value of T3 lie?',),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                //scrollDirection: Axis.vertical,//.horizontal
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 1,
                    // ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Text(
                        'Thyroid Profile',
                        style: HeadingText,
                      ),
                      SizedBox(height: 15),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                            labelText: 'What range dose the value of T3 lie?',
                            labelStyle: Qtext,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),

                        value: dropdownValue,
                        hint: const Text('Select'),
                        icon: const Icon(Icons.arrow_drop_down),
                        //  elevation: 16,

                        onChanged: (String? newValue) {
                          dropdownValue = newValue!;
                        },
                        items: NormalValue.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Questions(
                          text: text,
                          dropdownValue: 'Normal',
                          NormalValue: NormalValue),
                      SizedBox(height: 20),





                      ElevatedButton(
                          onPressed: () async{
                            print('///////////////');
                            ReportsController.fun();

                            print('///////////////');
                            // symptomsBox.write(
                            //     'symptoms', symptomscontroller.selectedSymptoms);
                            //
                            //  Get.to(() => (MyApp1()));
                            //Get.to(() => (ExistingIllness()));
                            //var resp = await searchSymptomsApi("hair") ;
                            //  await addSymptoms(temp);
                            //  symptomscontroller.addsym();
                          //  symptomscontroller.post();
                            //  await addSymptoms("7", "Cool ");0
                            // print(resp);
                          },

                          child: Text("Next"),
                          style: ElevatedButton.styleFrom(primary: buttoncolor)),


                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       labelText: 'What range dose the value of T4 lie?',
                      //       labelStyle: Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //
                      //   value: dropdownValue,
                      //   hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   //elevation: 16,
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: NormalValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(height: 20),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       labelText: 'What range dose the value of THS lie?',
                      //       labelStyle: Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //   value: dropdownValue,
                      //   hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: NormalValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(height: 20),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       labelText: 'What range dose the value of FT4 lie?',
                      //       labelStyle: Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //
                      //   value: dropdownValue,
                      //   hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   //elevation: 16,
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: NormalValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(height: 20),
                      // Text(
                      //   'Lipid Profile',
                      //   style: HeadingText,
                      // ),
                      // SizedBox(height: 15),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       labelText:
                      //           'Dose Lipid profile show High cholesterol?',
                      //       labelStyle: Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //   value: dropdownValue,
                      //   hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: YesNoValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(height: 20),
                      // Text(
                      //   'Xray or Echocardiography',
                      //   style: HeadingText,
                      // ),
                      // SizedBox(height: 15),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       // labelText:
                      //       // 'Dose Xray or Echocardiography show Cardiomegaly and / or Pericardial effusion?',
                      //
                      //       hintText:
                      //           'Dose Xray or Echocardiography show Cardiomegaly and / or Pericardial effusion?',
                      //       hintMaxLines: 3,
                      //       //labelStyle:Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //   value: dropdownValue,
                      //   // hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   //elevation: 160,
                      //   //isExpanded: true,
                      //   // isDense = true
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: YesNoValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(height: 20),
                      // Text(
                      //   'LFT - Liver Function Test',
                      //   style: HeadingText,
                      // ),
                      // SizedBox(height: 15),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       labelText:
                      //           'What range dose the value of bilirubin and liver enzymes lie?',
                      //       labelStyle: Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //   value: dropdownValue,
                      //   hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: NormalValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(height: 20),
                      // Text(
                      //   'ECG',
                      //   style: HeadingText,
                      // ),
                      // SizedBox(height: 15),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //       labelText:
                      //           'Dose the ECG show fast heart rate/irregular rhythm?',
                      //       labelStyle: Qtext,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0))),
                      //   value: dropdownValue,
                      //   hint: const Text('Select'),
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onChanged: (String? newValue) {
                      //     dropdownValue = newValue!;
                      //   },
                      //   items: YesNoValue.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            ElevatedButton(
                onPressed: () {
                  // Get.to(() => (ReportPage()));
                },
                child: Text("Proceed"),
                style: ElevatedButton.styleFrom(primary: buttoncolor)),
          ],

        ),
      ),
    );
  }
}

