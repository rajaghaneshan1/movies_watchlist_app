import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movies_watchlist_app/auth/controller/authentication_controller.dart';
import 'package:movies_watchlist_app/constants.dart';
import 'package:movies_watchlist_app/home/view/movies_list_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.black,
              Colors.blue.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Movies App',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Obx(
                () => homeController.isLoading.value
                    ? loadingWidget()
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: kRed,
                          padding: const EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          homeController.isLoading.value = true;
                          AuthenticationController.signInWithGoogle()
                              .then((user) {
                            if (user != null) {
                              homeController.isLoading.value = false;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MoviesListScreen(),
                                ),
                              );
                            }
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.google),
                        label: const Text(
                          'Sign in with Google',
                          style: buttonTextStyle,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    homeController.isLoading.value = false;
    super.dispose();
  }
}
