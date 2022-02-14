import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyanodoc_test/app/data/model/User_Model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(_doc);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateusername(String newValue, String uid) async {
    try {
      _firestore.collection("users").doc(uid).update({"username": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
