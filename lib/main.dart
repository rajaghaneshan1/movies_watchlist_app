import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_watchlist_app/auth/view/auth_screen.dart';
import 'package:movies_watchlist_app/constants.dart';
import 'package:movies_watchlist_app/home/controller/home_controller.dart';
import 'package:movies_watchlist_app/home/view/movies_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = firebaseAuth.currentUser;
    return GetMaterialApp(
      title: 'Movies Watchlist App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.nunito().fontFamily,
        brightness: Brightness.dark,
      ),
      home: user != null ? const MoviesListScreen() : const AuthScreen(),
    );
  }
}
