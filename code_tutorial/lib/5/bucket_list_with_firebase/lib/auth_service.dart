import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  void signUp({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    if (email.isEmpty) {
      onError("Please enter email");
      return;
    } else if (password.isEmpty) {
      onError("Please enter password");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        onError('Please enter valid email');
      } else if (e.code == 'invalid-password') {
        onError('Please enter valid password');
      } else if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      } else {
        onError(e.message!);
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  void login({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    if (email.isEmpty) {
      onError("Please enter email");
      return;
    } else if (password.isEmpty) {
      onError("Please enter password");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      } else {
        onError(e.message!);
      }
    
    } catch (e) {
      onError(e.toString());
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
