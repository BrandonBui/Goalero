import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';

class editProfile extends StatefulWidget {
  //final AppUser curUser;

  //const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  debugPrint("Back Pressed");
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back_ios_new_rounded),),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                    left: 22,
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                ),
                child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        //Spacing above Greeting text
                        const SizedBox(
                          height: 10,
                        ),
                        //Greeting
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                    //controller: _nameController,
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
                                    //controller: _usernameController,
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //###SETTINGS BOX2###
            Container(
              //box 2
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    //top: 22,
                    ),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            child: Image.asset("images/Goalero Logo No BG.png")),
      
                        //Space between image and first text field
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 50, //height of button
                  width: 175, //width of button
                  child: ElevatedButton(
                    child: Text(
                      "Update Info",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF65BFA3)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180)))),
                    onPressed: () {
                      debugPrint("Update Info Clicked!");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
