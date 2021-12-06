// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_watchlist_app/constants.dart';

class AuthenticationController {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(authCredential);
      if (userCredential != null) {
        await usersRef.doc(userCredential.user!.uid).set({
          'name': userCredential.user!.displayName,
          'user_id': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'timestamp': DateTime.now(),
          'photoUrl': userCredential.user!.photoURL,
        });
        return userCredential;
      }
    } on PlatformException catch (_) {
    } on FirebaseAuthException catch (_) {}
  }

  static Future signOut() async {
    googleSignIn.signOut();
    firebaseAuth.signOut();
  }
}
