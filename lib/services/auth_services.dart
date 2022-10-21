import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_auth/services/db_services.dart';

class AuthServices {
  FirebaseAuth firebaseApp = FirebaseAuth.instance;
  //login

  //reg

  Future regWithEmailPass({required String fullName, required String email, required String pass}) async {
    try {
      UserCredential userCredential =
          await firebaseApp.createUserWithEmailAndPassword(email: email, password: pass);
      User? user = userCredential.user;
      if (user != null) {
        // save data in db
        await DBServices().savingUserData(fullName, email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return e.message;
    }
  }

  //sign out

}
