// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cyanodoc_test/app/data/services/Auth_Controller.dart';
//
// class AuthService {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   //final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//
//   Stream<User?> Function() onAuthChanged() {
//     return auth.authStateChanges;
//   }
//   Future<String?> signInWithEmailAndPassword(
//       String email, String password) async {
//     UserCredential result = await auth.signInWithEmailAndPassword(
//         email: email, password: password);
//     return result.user?.uid;
//   }
//
//   // Future<String> signInWithGoogle() async {
//   //   await _googleSignIn.signOut();
//   //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//   //   final GoogleSignInAuthentication googleAuth =
//   //   await googleUser.authentication;
//   //   final AuthCredential credential = GoogleAuthProvider.getCredential(
//   //     accessToken: googleAuth.accessToken,
//   //     idToken: googleAuth.idToken,
//   //   );
//   //   await _firebaseAuth.signInWithCredential(credential);
//   //   FirebaseUser user = await _firebaseAuth.currentUser();
//   //   return user.uid;
//   // }
//
//   Future<bool> isSignedIn() async {
//     final currentUser = await auth.currentUser!;
//     return currentUser != null;
//   }
//
//   // Future<String> signUp(
//   //     String email,
//   //     String password, {
//   //       String username,
//   //     }) async {
//   //   AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//   //     email: email,
//   //     password: password,
//   //   );
//   //   return result.user.uid;
//   // }
//
//   Future<User> getCurrentUser() async {
//     User user = await auth.currentUser!;
//     return user;
//   }
//
//   // Future<String> getAccessToken() async {
//   //   FirebaseUser user = await getCurrentUser();
//   //   IdTokenResult tokenResult = await user.getIdToken();
//   //   return tokenResult.token;
//   // }
//   //
//   // Future<String> getRefreshToken() async {
//   //   FirebaseUser user = await _firebaseAuth.currentUser();
//   //   IdTokenResult tokenResult = await user.getIdToken(refresh: true);
//   //   return tokenResult.token;
//   // }
//
//   Future<Future<List<void>>> signOut() async {
//     return Future.wait([
//       auth.signOut(),
//       //_googleSignIn.signOut(),
//     ]);
//   }
//
// // Future<void> sendEmailVerification() async {
// //   FirebaseUser user = await _firebaseAuth.currentUser();
// //   user.sendEmailVerification();
// // }
//
// // Future<bool> isEmailVerified() async {
// //   FirebaseUser user = await _firebaseAuth.currentUser();
// //   return user.isEmailVerified;
// // }
//
// // @override
// // Future<void> changeEmail(String email) async {
// //   FirebaseUser user = await _firebaseAuth.currentUser();
// //   return user.updateEmail(email);
// // }
// //
// // @override
// // Future<void> changePassword(String password) async {
// //   FirebaseUser user = await _firebaseAuth.currentUser();
// //   user.updatePassword(password).then((_) {
// //     print("Succesfull changed password");
// //   }).catchError((error) {
// //     print("Password can't be changed" + error.toString());
// //   });
// //   return null;
// // }
//
// // @override
// // Future<void> deleteUser() async {
// //   FirebaseUser user = await _firebaseAuth.currentUser();
// //   user.delete().then((_) {
// //     print("Succesfull user deleted");
// //   }).catchError((error) {
// //     print("user can't be delete" + error.toString());
// //   });
// //   return null;
// // }
//
// // @override
// // Future<void> sendPasswordResetMail(String email) async {
// //   await _firebaseAuth.sendPasswordResetEmail(email: email);
// //   return null;
// // }
// }
//
