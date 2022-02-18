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

    final emailField = TextFormField(
      autofocus: false,
      controller: authController.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password
    final passwordField = TextFormField(
      autofocus: false,
      controller: authController.passwordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

// button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: buttoncolor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            authController.signIn();
           // authController.handleSignIn(SignInType.EMAIL_PASSWORD);
          },
          child: Text("Login",
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
              padding: const EdgeInsets.all(30.0),
              child: Form(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[

                     Image.asset('assets/cyanodoclogo.png',
                         height: 75.0,
                         width: 75.0,
                         ),
                    Image.asset('assets/cyanodoctext.png',
                      //height: 100.0,
                     width: 200.0,
                    ),

                    SizedBox(height: 40),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    loginButton,

                    //SizedBox(height: 10),
                  ]


                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}

