import 'package:firebase_auth/firebase_auth.dart';

class AuthServicesClass {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<UserCredential?> loginUseingEmailAndPassword({
    required String email,
    required String password,
  })
  async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
    }
    return null;
  }


  // static Future<UserCredential?> SignUseingEmailAndPassword({
  //   required String email,
  //   required String password,
  // })
  // async {
  //   try {
  //     final userCredential = await _firebaseAuth.CreateSignInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     print('Login failed: ${e.message}');
  //   }
  //   return null;
  // }

}