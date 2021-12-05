import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//firebase
GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
FirebaseStorage firebaseStorage = FirebaseStorage.instance;

//
const Color kRed = Color.fromARGB(255, 225, 25, 56);

ButtonStyle? elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: kRed,
  padding: const EdgeInsets.all(10.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

//placeholder image
const String placeHolderImage =
    'https://www.kevingage.com/assets/clapboard.png';
