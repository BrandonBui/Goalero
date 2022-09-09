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
    if (passwordConfirmed() && passwordComplexity()) {
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
      setState(() {
        errorMessage = "Passwords do not match";
      });
      return false;
    }
  }

  bool passwordComplexity() {
    //Regex checks that password has at least 1 digit, and 1 special character,
    //and that it is at least 12 characters.
    RegExp regex = RegExp(r'^(?=.*?[0-9])(?=.*?[!@#\$&*~?-]).{12,}$');

    //If the password does not meet the requirements then the error message gets
    //set below and false is returned.
    if (!regex.hasMatch(_passwordController.text.trim())) {
      errorMessage = "Please enter a password that meets the reuirements above";
      return false;
    } else {
      return true;
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
                height: 720,
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
                        //Spacing above Greeting text
                        const SizedBox(
                          height: 10,
                        ),
                        //Greeting
                        const Text(
                          "Looks Like You're New!",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Spacing between greeting lines
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
                                  contentPadding:
                                      EdgeInsets.fromLTRB(8, 13, 8, 8),
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
                                  contentPadding:
                                      EdgeInsets.fromLTRB(8, 13, 8, 8),
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

                        //#### Password Requirements #####
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            // ignore: prefer_adjacent_string_concatenation
                            // ignore: prefer_interpolation_to_compose_strings
                            "Password requirements:                          " +
                                "        " +
                                "\n    -At least 12 characters" +
                                "\n    -At least 1 number" +
                                "\n    -At least 1 special character (!@#\$&*~?-)",
                            textAlign: TextAlign.left,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //Signup error messages
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            errorMessage,
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
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
