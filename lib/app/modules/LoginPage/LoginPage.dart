//import 'package:cyanodoc_test/app/modules/ProfilePage/ProfilePage.dart';
import 'dart:ui';

import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';

//import 'package:cyanodoc_test/app/data/services/Auth_Service1.dart';
//import 'package:cyanodoc_test/app/data/services/

class LoginPage extends StatelessWidget {
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    final phoneField = TextFormField(
      autofocus: false,
      controller: authController.phoneNumberController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mobile Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // //verification
    final verificationField = TextFormField(
      autofocus: false,
      controller: authController.verificationController,
      keyboardType: TextInputType.phone,
      //obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        // prefixIcon: Icon(Icons.domain_verification, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "enter verifactionn code",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

// generateOTP button
    final generateOtpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: buttoncolor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            await authController.phoneSignIn();
            // authController.handleSignIn(SignInType.EMAIL_PASSWORD);
          },
          child: Text("Generate OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
    );

    // verification button
    final verificationButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: buttoncolor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            //  Get.to(() => (UserProfile()));
            String userInput = authController.verificationController.text;
            // print('');
            authController.checkCredential(
                verID: authController.verificationIdResult, smsCode: userInput);

          },
          child: Text("Verify",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
    );

    return Scaffold(
      backgroundColor: backgroucolor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Container(
            //decoration: BoxDecoration(
            // color: Colors.white,
            // border: Border.all(
            //   //color: Colors.red,
            // ),
            // borderRadius: BorderRadius.all(Radius.circular(15))),
            // padding: EdgeInsets.all(5),

            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/cyanodoclogo.png',
                        height: 75.0,
                        width: 75.0,
                      ),
                      Image.asset(
                        'assets/cyanodoctext.png',
                        //height: 100.0,
                        width: 200.0,
                      ),

                      SizedBox(height: 40),

                      Obx(() {
                        return authController.codeSentResult == "yes"
                            ? Column(
                                children: [
                                  const Text(
                                      'Enter Verification Code Sent To Your Mobile Number'),
                                  SizedBox(height: 10),
                                  verificationField,
                                  SizedBox(height: 25),
                                  verificationButton,
                                ],
                              )
                            :

                            Column(
                                children: [
                                  phoneField,
                                  SizedBox(height: 25),
                                  generateOtpButton,
                                ],
                              );
                      })

                      //SizedBox(height: 10),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
