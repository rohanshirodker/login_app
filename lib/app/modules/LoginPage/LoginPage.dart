import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';

import 'package:cyanodoc_test/app/data/signin_enum.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: authController.emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: authController.passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue,
                    onPressed: () {
                      authController.handleSignIn(SignInType.EMAIL_PASSWORD);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.primaries[0],
                    onPressed: () {
                      authController.handleSignIn(SignInType.GOOGLE);
                    },
                    child: Text(
                      "SignIn with Google",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/register");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("No account ? Register Here!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:cyanodoc_test/app/modules/ProfilePage/ProfilePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   //firebase variable
//   final _auth = FirebaseAuth.instance;
//
//   // editing controller
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     //email
//     final emailField = TextFormField(
//       autofocus: false,
//       controller: emailController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("Please Enter Your Email");
//         }
//         // reg expression for email validation
//         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
//           return ("Please Enter a valid email");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         emailController.text = value!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.mail, color: Colors.black),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//
//     //password
//     final passwordField = TextFormField(
//       autofocus: false,
//       controller: passwordController,
//       obscureText: true,
//       validator: (value) {
//         RegExp regex = new RegExp(r'^.{6,}$');
//         if (value!.isEmpty) {
//           return ("Password is required for login");
//         }
//         if (!regex.hasMatch(value)) {
//           return ("Enter Valid Password(Min. 6 Character)");
//         }
//       },
//       onSaved: (value) {
//         passwordController.text = value!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//
// // button
//     final loginButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.deepPurple,
//       child: MaterialButton(
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             signIn(emailController.text, passwordController.text);
//           },
//           child: Text("Login",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold))),
//     );
//
//     return Scaffold(
//       backgroundColor: Colors.purple[900],
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(10),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: Colors.red,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(25))),
//             // padding: EdgeInsets.all(5),
//
//             //color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     emailField,
//                     SizedBox(height: 25),
//                     passwordField,
//                     SizedBox(height: 25),
//                     loginButton,
//                     //SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   //login function
//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       await _auth
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then((uid) => {
//                 Fluttertoast.showToast(msg: "Login Successful"),
//                 Get.to(ProfilePage()),
//               })
//           .catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
//   }
// }
