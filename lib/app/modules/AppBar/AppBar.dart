import 'package:cyanodoc_test/app/core/values/colors.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
import 'package:cyanodoc_test/app/modules/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




final topAppBar = AppBar(
    elevation: 0,
  backgroundColor: backgroucolor,
   title:GestureDetector(
     onTap: () {
       Get.offAll(() => HomePage());
     }, // Image tapped
     child: Row(
       children: [
         Image.asset(
           'assets/cyanodoclogo.png',
           fit: BoxFit.cover, // Fixes border issues
           //width: 33.0,
           height: 28.0,
         ),
         Image.asset(
           'assets/cyanodoctext.png',
           fit: BoxFit.cover, // Fixes border issues
           //width: 33.0,
           height: 20.0,
         ),
       ],
     ),
   ),


  automaticallyImplyLeading: false,
    actions: [
    IconButton(
      icon: Icon(Icons.logout,color: Colors.black),
      onPressed: () {
        AuthController.to.sigOut();
      },
    ),

  ]


);