import 'package:firebase_auth/firebase_auth.dart';

import '../refs/firebase_refs.dart';

class AuthRepository {
  Future<void> signIn({
    String email = '',
    String password = '',
  }) async {
    try {
      await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {

    }
  }

  Future<void> signUp({

    String email = '',
    String password = '',
  }) async {
    try {
      // final UserCredential userCredential =
      await fireAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // final signedInUser = userCredential.user;
      // await fireUserDoc.doc(signedInUser!.uid).set(
      //   {
      //     'username': username,
      //     'email': email,
      //     'password': password,
      //   },
      // );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
  get isUserLoggedIn{
    return fireAuth.currentUser==null;
  }
}
