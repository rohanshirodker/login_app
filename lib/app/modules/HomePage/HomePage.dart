import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/DiagnosisSummary/DiagnosisSummary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UserProfile/UserProfile.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true, actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            controller.sigOut();
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            if (Get.isDarkMode) {
              Get.changeTheme(ThemeData.light());
            } else {
              Get.changeTheme(ThemeData.dark());
            }
          },
        )
      ]),
      body: Container(
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => (DiagnosisSummary()));
                  },
                  child: Text("Diagnosis Summary"),
                  // logout(context);
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => (UserProfile()));
                  },
                  child: Text("user profile"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
