// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/reset_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignupPage;
  const LoginPage({Key? key, required this.showSignupPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool comingFromSignUp = false; // to check if screen can be popped to previous
  bool passwordHidden = true;
  String eyeIconName = "";

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                          controller: _emailController,
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15, left: 8),
                            border: InputBorder.none,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                _passViewChange();
                                debugPrint("eye clicked");
                              },
                              icon: Icon(Icons.remove_red_eye_rounded),
                            ),
                          ),
                          obscureText: passwordHidden,
                        ),
                      ),
                    ),
            
                    //forgot password
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ResetPassword();
                                }));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        )),
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
                          signIn();
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
                      onTap: widget.showSignupPage,
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
      ),
    );
  }

  void _passViewChange() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }
}
