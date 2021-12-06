import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_watchlist_app/home/controller/home_controller.dart';

//firebase
GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
FirebaseStorage firebaseStorage = FirebaseStorage.instance;


//getX
final HomeController homeController = HomeController.instance;


//color
const Color kRed = Color.fromARGB(255, 225, 25, 56);


//UI styling
ButtonStyle? elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: kRed,
  padding: const EdgeInsets.all(10.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

//textField Decoration
InputDecoration textFieldDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kRed,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kRed,
      ),
    ),
    errorStyle: TextStyle(color: Colors.red.shade100),
  );
}
//button text
const TextStyle buttonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);


//loading indicator
Widget loadingWidget() {
  return const Center(
    child: CircularProgressIndicator(
      color: kRed,
    ),
  );
}


//placeholder image
const String placeHolderImage =
    'https://www.kevingage.com/assets/clapboard.png';
