// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  bool passwordHidden = true;
  String eyeIconName = "";
  String errorMessage = "";

  //text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        errorMessage = "";
      } on FirebaseAuthException catch (error) {
        setState(() {
          errorMessage = error.message!;
        });
      }
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Container(
                height: 590,
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
                            child:
                                Image.asset("images/Goalero Logo No BG.png")),

                        SizedBox(
                          height: 20,
                        ),

                        //##### Name textfield #####
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF3F6F8),
                                border: Border.all(
                                  color: Color(0xFFD9E0E6),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                                hintText: "Name",
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return "Please enter your name.";
                                } else {
                                  return null; //name is valid/there is a name
                                }
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //##### Email textfield #####
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF3F6F8),
                                border: Border.all(
                                  color: Color(0xFFD9E0E6),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                                hintText: "Email",
                              ),
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? "Enter a valid email"
                                  : null,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //##### Password textfield #####
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
                              obscureText: passwordHidden,
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
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //##### Confirm password textfield #####
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
                              obscureText: passwordHidden,
                              controller: _confirmPasswordController,
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
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //##### Sign un button #####
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("Sign up Clicked");
                              final isValidForm =
                                  formKey.currentState!.validate();

                              if (isValidForm) {
                                setState(() {
                                  signUp();
                                });
                              }
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
                          onTap: widget.showLoginPage,
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
        ));
  }

  void _passViewChange() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }
}
