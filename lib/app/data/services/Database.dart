// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cyanodoc_test/app/data/model/User_Model.dart';
//
// class Database {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<UserModel> getUser(String uid) async {
  //   try {
  //    // DocumentSnapshot _doc =
  //        // await _firestore.collection("users").doc(uid).get();
  //     //return UserModel.fromDocumentSnapshot(_doc);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> updateusername(String newValue, String uid) async {
  //   try {
  //     _firestore.collection("users").doc(uid).update({"username": newValue});
  //   } catch (e) {
  //     //print(e);
  //     rethrow;
  //   }
  // }

  // Future<void> updatebiometrics(String uid, String age ,String weight ,String height) async {
  //   try {
  //     _firestore.collection("users")
  //         .doc(uid)
  //         .collection("biometrics")
  //         .doc('biometrics')
  //         .set({
  //       'age':age ,
  //       'wright':weight,
  //       'height':height,
  //     });
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  // Future<void> updatesymptoms(String uid,Map<String, dynamic> symptoms  ) async {
  //   try {
  //     _firestore.collection("users")
  //         .doc(uid)
  //         .collection("symptoms")
  //         .doc('symptoms')
  //         .set(
  //       symptoms,
  //     );
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
//}

// Future<void> batchDelete() {
//   WriteBatch batch = FirebaseFirestore.instance.batch();
//
//   return users.get().then((querySnapshot) {
//     querySnapshot.docs.forEach((document) {
//       batch.delete(document.reference);
//     });
//
//     return batch.commit();
//   });
// }