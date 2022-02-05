
import 'package:cyanodoc_test/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ProfilePage.dart';





class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
       child: Form(
         child: Column(
           children: <Widget>[
             SizedBox(height: 20.0),
             TextFormField(
               onChanged: (val){
                 setState(()=> email = val);

               },
             ),
             SizedBox(height: 20.0),
             TextFormField(
               obscureText: true,
               onChanged: (val){
                 setState(()=> pass = val);

               },
             ),

             ElevatedButton(
               child: Text('sign in'),
               onPressed: () async{
                 dynamic result = await _auth.signInAnon();
                 if(result == null ){
                   print('error signing in');
                 }
                 else{
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => ProfilePage()),
                   );
                 }
               },
             ),

           ],
         ),
       ),












    )
    );
  }
}