import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_watchlist_app/constants.dart';
import 'package:movies_watchlist_app/home/view/movies_list_screen.dart';

class AuthenticationController {
  static Future<UserCredential?> signInWithGoogle() async {
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
  }

  static Future signOut() async {
    googleSignIn.signOut();
  }
}
