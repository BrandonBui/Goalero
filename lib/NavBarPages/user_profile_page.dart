import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Temporary sign out function that can be activated by clicking hte profile
    //page text
    Future SignOut() async {
      await FirebaseAuth.instance.signOut();
    }

    return GestureDetector(
        onTap: () {
          debugPrint("Login Clicked");
          SignOut();
        },
        child: Container(
          color: const Color(0xFFF3F6F8),
          child: Center(
            child: Text(
              "Profile Page",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ));
  }
} //green