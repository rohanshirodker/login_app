import 'package:cyanodoc_test/app/modules/LoginPage/LoginPage.dart';
import 'package:cyanodoc_test/app/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:cyanodoc_test/app/modules/ProfilePage/ProfilePageController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  final profilePageController controller = Get.put(profilePageController());
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  SizedBox(height: 25),
                  Text('You have pushed the button this many times:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Obx(() => Text('${controller.count.value}',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  SizedBox(height: 20),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(height: 20),
                  Text("${loggedInUser.firstName}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("${loggedInUser.email}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  ActionChip(
                    label: Text("Logout"),
                    onPressed: () {
                      logout(context);
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext) async {
    await FirebaseAuth.instance.signOut();
    Get.off(LoginPage());
  }
}
