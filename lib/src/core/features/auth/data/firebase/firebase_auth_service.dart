import 'package:firebase_auth/firebase_auth.dart';

import '../dto/sign_up_dto.dart';

sealed class FirebaseAuthService {
  static final _authInstance = FirebaseAuth.instance;

  static Future<String> registerWithEmailAndPassword({
    required SignUpDto signUpData,
  }) async {
    try {
      final res = await _authInstance.createUserWithEmailAndPassword(
        email: signUpData.email,
        password: signUpData.password,
      );
      if (res.user != null) {
        res.user?.sendEmailVerification();
        return res.user?.uid ?? '';
      } else {
        throw ('Unable to sign up please try again later');
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw 'Email is invalid';
        case 'email-already-in-use':
          throw 'The email address is already in use by another account.';
        case 'weak-password':
          throw 'Password should be at least 6 characters';
        default:
          throw 'Unable to sign up please try again later';
      }
    } catch (e) {
      throw 'Unable to sign up please try again later';
    }
  }
}
