import 'package:firebase_auth/firebase_auth.dart';

class Authservice{
  final FirebaseAuth _auth = FirebaseAuth.instance;

//chage user steream
 // Stream<FirebaseUser> get user {
 // return _auth.onAuthStateChanged;
  }

  // sign out
Future signOut() async{
    try{
     // return await _auth.signOut();
    }catch(e){
        print(e.toString());
        return null;
    }

}
//}