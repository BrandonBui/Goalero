// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool passwordHidden = true;
  String eyeIconName = "";

  @override
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
                    //Greeting
                    const Text(
                      "Looks Like You're New!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Let's get you set up.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // Image Area
                    SizedBox(
                        height: 150,
                        //color: Colors.green,
                        //padding: EdgeInsets.all(100),
                        child: Image.asset("images/Goalero Logo No BG.png")),

                    SizedBox(
                      height: 20,
                    ),

                    //Name textfield
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
                            hintText: "Name",
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _passViewChange();
                                  debugPrint("eye icon clicked");
                                },
                                icon: Icon(Icons.remove_red_eye_rounded),
                              )),
                          obscureText: passwordHidden,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //Confirm pass textfield
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
                              hintText: "Confirm Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _passViewChange();
                                  debugPrint("eye icon clicked");
                                },
                                icon: Icon(Icons.remove_red_eye_rounded),
                              )),
                          obscureText: passwordHidden,
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
                              "Sign Up",
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
                        Navigator.pushNamed(context, "/loginPage");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Not new? ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Sign In",
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
      ),
    );
  }

  void _passViewChange() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }
}
