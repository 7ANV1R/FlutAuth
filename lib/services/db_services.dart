import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DBServices {
  //collection ref
  CollectionReference userCollectionRef = FirebaseFirestore.instance.collection("users");

  //saving user data

  Future savingUserData(String fullName, String email) async {
    try {
      return userCollectionRef.doc().set({
        "fullName": fullName,
        "email": email,
        "userImg": "some_valid_url",
      });
    } catch (e) {
      log(e.toString());
      return e;
    }
  }

  Future gettingUserData(String email) async {
    try {
      QuerySnapshot snapshot = await userCollectionRef.where("email", isEqualTo: email).get();
      return snapshot;
    } catch (e) {
      log(e.toString());
      return e;
    }
  }
}
