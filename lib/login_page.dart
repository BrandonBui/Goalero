// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool comingFromSignUp = false; // to check if screen can be popped to previous

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6F8),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 500,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(5, 5)
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 241, 240, 240),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(-5, -5)
                ),
              ],
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //Greeting
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Let's get back to your goals.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Image Area
                  Container(
                      height: 150,
                      //color: Colors.green,
                      //padding: EdgeInsets.all(100),
                      child: Image.asset("images/Goalero Logo No BG.png")),

                  SizedBox(
                    height: 20,
                  ),

                  //Email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F6F8),
                          border: Border.all(
                            color: Color(0xFFD9E0E6),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Pass textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F6F8),
                          border: Border.all(
                            color: Color(0xFFD9E0E6),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),

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
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xFF3f826d),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xFF3f826d))),
                        child: Center(
                          child: Text(
                            "Sign In",
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

                  SizedBox(
                    height: 10,
                  ),

                  //Forgot your password text button and SignUp text Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signupPage");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "First Time? ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Make an Account!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}