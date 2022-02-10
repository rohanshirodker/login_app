import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User?> onAuthChanged() {
    print("onAuthChanged");
    return _firebaseAuth.authStateChanges();
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print(result.user!.uid);
    return result.user!.uid;
  }

  // Future<String> signInWithGoogle() async {
  //   await _googleSignIn.signOut();
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   await _firebaseAuth.signInWithCredential(credential);
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   return user.uid;
  // }

  Future<bool> isSignedIn() async {
    print('issiginedin');
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  // Future<String> signUp(
  //     String email,
  //     String password, {
  //       required String username,
  //     }) async {
  //   UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //   return result.user.uid;
  // }

  Future<User?> getCurrentUser() async {
    print("getcurrentuser");
    User? user = await _firebaseAuth.currentUser;

    return user;
  }

  Future<String?> getAccessToken() async {
    print("accessing token");
    User? user = await getCurrentUser();
    IdTokenResult tokenResult = (await user?.getIdToken(true)) as IdTokenResult;

    return tokenResult.token;
  }

  Future<String?> getRefreshToken() async {
    User user = await _firebaseAuth.currentUser!;
    IdTokenResult tokenResult = (await user.getIdToken(true)) as IdTokenResult;
    return tokenResult.token;
  }

  Future<Future<List>> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      // _googleSignIn.signOut(),
    ]);
  }

//
}
