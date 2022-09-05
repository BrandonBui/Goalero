import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TempHome extends StatefulWidget {
  @override
  State<TempHome> createState() => _TempHomeState();
}

class _TempHomeState extends State<TempHome> {
  Future SignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6F8),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 570,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(5, 5)),
                BoxShadow(
                    color: Color.fromARGB(255, 241, 240, 240),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(-5, -5)),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 10,
                    ),

                    //Sign In button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("Login Clicked");
                          SignOut();
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFF3f826d),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xFF3f826d))),
                          child: Center(
                            child: Text(
                              "Sign out",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
