import 'package:cyanodoc_test/app/data/provider/SymptomsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SymptomsPageController extends GetxController {
  final _symptoms = {
    SymptomsData(id: 1, name: "Headache"): false,
    SymptomsData(id: 2, name: "Stomach ach"): false,
    SymptomsData(id: 3, name: "Hair loss"): false,
    SymptomsData(id: 4, name: "Headache2"): false,
    SymptomsData(id: 5, name: "Stomach ach2"): false,
    SymptomsData(id: 6, name: "Hair loss2"): false,
  }.obs;

  void toggle(SymptomsData data) {
    _symptoms[data] = !(_symptoms[data] ?? true);
    print(_symptoms[data]);
  }

  get selectedSymptoms => _symptoms.entries
      .where((element) => element.value)
      .map((e) => e.key)
      .toList();

  get symptomsdata => _symptoms.entries.map((e) => e.key).toList();
}

class SymptomsWidget extends StatelessWidget {
  final SymptomsData symptomsData;

  SymptomsWidget({Key? key, required this.symptomsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,

      child: Center(
        child: Text(
          symptomsData.name.toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

    );
  }
}

class SymptomsFilter extends StatelessWidget {
  SymptomsPageController symptomscontroller = Get.put(SymptomsPageController());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(10),

          child: ListView.builder(
            itemCount: symptomscontroller.symptomsdata.length,
            itemBuilder: (_, int index) {
              return Card(
                child: ListTile(

                  selected: symptomscontroller.selectedSymptoms
                      .contains(symptomscontroller.symptomsdata[index]),
                  selectedTileColor: Color(0xFFDAE6F7),//Colors.lightBlueAccent[100],//Color(0xFFDAE6F7),.


                  onTap: () =>
                      {
                    symptomscontroller
                        .toggle(symptomscontroller.symptomsdata[index])
                  },
                  title: SymptomsWidget(
                      symptomsData: symptomscontroller.symptomsdata[index]),

                ),

              );
            },
          ),
        ),
      ),
    );
  }
}

class SelectedSymptoms extends StatelessWidget {
  final SymptomsPageController symptomscontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => Expanded(
          child: ListView.builder(
            itemCount: symptomscontroller.selectedSymptoms.length,
            itemBuilder: (_, int index) {
              return ListTile(
                title: SymptomsWidget(
                    symptomsData: symptomscontroller.symptomsdata[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
