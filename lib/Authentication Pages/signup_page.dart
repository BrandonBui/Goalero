// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

//Found out how to do gradient on this site
//https://www.woolha.com/tutorials/flutter-using-radialgradient-examples#:~:
//text=In%20Flutter%27s%20RadialGradient%2C%200%20means%20the%20center%
//20of,used%20to%20set%20where%20the%20second%20fraction%20stops.
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
  late UserCredential userCreds;
  late User? user;

  //text controllers
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  /*
  signUp

  This method creates a new user in Firebase using the creatUser method that
  firebase provides. At this moment, this method can only create a user using an
  email and password provided by the user, there is no SSO capabilities yet.
  This method checks that the two passwords entered by the user matches, and
  that the password meets the complexity requirements. In the event of an error,
  the try catch should catch the error's message and assign it to the
  errorMessage variable, allowing it to be displayed to the user.
  */
  Future signUp() async {
    bool ageAccept = await ageAcceptance(context);
    if (passwordConfirmed() && passwordComplexity() && ageAccept) {
      try {
        userCreds = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        user = userCreds.user;
      } on FirebaseAuthException catch (error) {
        //setState is required so that the widget is rebuilt to display the new
        //text.
        setState(() {
          errorMessage = error.message!;
        });
      }

      //Once user is created, the personal information is stored.
      addUserDetails(_nameController.text.trim(),
          _usernameController.text.trim(), _emailController.text.trim());
      errorMessage = "";
    }
  }

  /*
  addUserDetails

  This method is used to add the user's first, last name, and email into
  Firestore. This method creates a new document using the user's ID number which
  gets created when they sign up. This ensures that the document for each user
  will have different names. This document is created within the users
  collection in Firestore.  The parameters for this method should just take the
  TextEditingControllers associated with each parameter name.

  Update 9/16/2022
  Email field removed since FireAuth instace already stores the email address. 4 
  new fields added: bio, goal count, badge count, and friend count. These are
  just being instantiated with "default" values being assigned to them.

  @param firstName  The user's first name.
  @param lastName   The user's last name.
  @param email      The user's email.
  */
  Future addUserDetails(String name, String username, String email) async {
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
      "real name": name,
      "username": username,
      "bio": "",
      "goal count": 0,
      "badge count": 0,
      "friend count": 0
    });
  }

  /*
  passwordConfirmed

  This method checks that the two passwords that the user enters matches. The
  method will return true if they match and false if they do not as well as 
  assigning a message to the errorMessage variable to be displayed to the user.

  @return bool  True if passwords match, false if they do not.
  */
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

  /*
  passwordComplexity

  This method checks that the password meets the complexity requirements using
  a regex. The current password requirements are as follows:
  - At least 1 digit
  - At least 1 special character
  - At lease 12 characters
  If the password meets these requirements the true will be returned if it does
  not meet these requirements then false will be returned as well as setting the
  errorMessage variable to a message advising the user to enter a password that
  meets the complexity requirements.

  @return boolean True if the password matches complexity requirements, false if
                  it does not meet the requirements.
  */
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

  /*
  passViewChange

  This method is used to change the status of the obscuretiy of the password
  field. It is designed to just switch this bool variable to the opposite of
  what it currently is.
  */
  void _passViewChange() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  Future ageAcceptance(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              // ignore: prefer_interpolation_to_compose_strings
              // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
              "To finish sign up, you agree that you are at least 13 years of" +
                  " age. Click cancel if you are younger then 13 and to abort" +
                  " sign up. Click accept to agree and continue.",
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                child: Text(
                  'Accept',
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3F6F8),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Center(
              child: Container(
                height: 750,
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
                //##### Main Window #####
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
                          textAlign: TextAlign.center,
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

                        //Space between greeting and image
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

                        //Space between image and first text field
                        SizedBox(
                          height: 20,
                        ),

                        //##### First and last name textfield #####
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF3F6F8),
                                      border: Border.all(
                                        color: Color(0xFFD9E0E6),
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: _nameController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: InputBorder.none,
                                      hintText: "Name (Not displayed publicly)",
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
                              //Distance between first and last name fields
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF3F6F8),
                                      border: Border.all(
                                        color: Color(0xFFD9E0E6),
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: _usernameController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: InputBorder.none,
                                      hintText: "Username (Displayed publicly)",
                                    ),
                                    validator: (value) {
                                      if (value == "") {
                                        return "Please enter a username.";
                                      } else {
                                        return null; //name is valid/there is a name
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Space between first and second row of text fields
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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

                        //Space between email and password textfield
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

                        //Space between password and confirm password fields
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

                        //Space between confirm password and password
                        //requirements
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

                        //Space between password requirements and any sign up
                        //error messages
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

                        //Space between sign up error messages and sign up
                        //button
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
                                  color: Color.fromARGB(255, 126, 50, 212),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 126, 50, 212))),
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

                        //Sign up page button
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
}
