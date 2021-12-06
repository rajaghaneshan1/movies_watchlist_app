import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_watchlist_app/auth/controller/authentication_controller.dart';
import 'package:movies_watchlist_app/auth/view/auth_screen.dart';
import '../../../constants.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: kRed,
                  backgroundImage: NetworkImage(
                      firebaseAuth.currentUser!.photoURL ?? placeHolderImage),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${firebaseAuth.currentUser!.displayName}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${firebaseAuth.currentUser!.email}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                AuthenticationController.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
              style: elevatedButtonStyle,
              icon: const Icon(FontAwesomeIcons.signOutAlt),
              label: const Text(
                'Sign Out',
                style: buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
