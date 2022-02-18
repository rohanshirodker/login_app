import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/data/services/Database.dart';
import 'package:cyanodoc_test/app/modules/AppBar/AppBar.dart';
import 'package:cyanodoc_test/app/modules/UserProfile/UserProfileController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends GetWidget<AuthController> {
  final TextEditingController _updateusername = TextEditingController();
  static const IconData verified =
      IconData(0xe699, fontFamily: 'MaterialIcons');
  late String _uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroucolor,
      appBar: topAppBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 25),
                  GetX<UserProfileController>(
                    builder: (_) {
                      if (_.user.firstName != null) {
                        return Text("Name:  ${_.user.firstName} ");
                      } else {
                        return Text("Loading...");
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  GetX<UserProfileController>(
                    builder: (_) {
                      if (_.user.username != null) {
                        _uid = _.user.uid!;
                        return Text("Username:  ${_.user.username} ");
                      } else {
                        return Text("Loading...");
                      }
                    },
                  ),
                  TextFormField(
                    controller: _updateusername,
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      if (_updateusername.text != "") {
                        Database().updateusername(_updateusername.text, _uid);
                        Get.find<UserProfileController>().userupadte(_uid);
                        _updateusername.clear();

                        ;
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  GetX<UserProfileController>(
                    builder: (_) {
                      if (_.user.Phone != null) {
                        return Text("Phone:  ${_.user.Phone}");
                      } else {
                        return Text("Loading...");
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  GetX<UserProfileController>(
                    builder: (_) {
                      if (_.user.email != null) {
                        return Text("Email:  ${_.user.email}");
                      } else {
                        return Text("Loading...");
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  Icon(
                      controller.userverefied() == false
                          ? Icons.verified
                          : Icons.verified,
                      size: 35,
                      color: controller.userverefied() == false
                          ? Colors.grey[800]
                          : Colors.blue),
                ],
              )),
        ),
      ),
    );
  }
}
