import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';

class customAddGoal extends StatefulWidget {
  final AppUser curUser;
  const customAddGoal(this.curUser);

  @override
  State<customAddGoal> createState() => _customAddGoalState();
}

class _customAddGoalState extends State<customAddGoal> {
  final authUser = FirebaseAuth.instance.currentUser;

  Future addNewGoal(String goalName, String goalCategory,
      String goalDescription, String goalCompletionDate) async {
    int goalNumber = widget.curUser.goalCount + 1;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(authUser!.uid)
        .collection("goals")
        .doc("goal$goalNumber")
        .set({
      "goal name": goalName,
      "goal category": goalCategory,
      "goal description": goalDescription,
      "goal completion date": goalCompletionDate
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //final args = ModalRoute.of(context)!.settings.arguments as specificAddGoal;
    return Scaffold(
        backgroundColor: Color(0xFF80D8FF),
        body: SingleChildScrollView(
          //to make page scrollable
          child: Column(
            children: [
              Container(
                height: height / 3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight, //to make gradient
                        colors: [
                      Color(0xFFB7A8FF),
                      Color(0xFFA3B2FF),
                      Color(0xFFA0B4FF),
                      Color(0xFF9CB6FF),
                      Color(0xFF90BDFF),
                      Color(0xFF85C4FF),
                      Color(0xFF7ECEFF),
                      Color(0xFF80D8FF),
                      Color(0xFF7CD0FF),
                    ])),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(top: 30.0, left: 30.0),
                        child: GestureDetector(
                          child: const Icon(Icons.arrow_back_ios_new),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: SafeArea(
                        child: Text("Custom Goal",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What is your activity's name?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: width / 1.2,
                          height: height / 14,
                          child: PhysicalModel(
                            elevation: 10.0,
                            color: Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(25),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                labelText: 'Goal Name...',
                                filled: true,
                                fillColor: Color(0xFFF4F4F4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text("What are your goals regarding this activity?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width / 1.2,
                          height: height / 3,
                          child: PhysicalModel(
                            elevation: 10.0,
                            color: Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(25),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                labelText: 'Enter in some Goals...',
                                filled: true,
                                fillColor: Color(0xFFF4F4F4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                            "At what time do you want to end this activity? (mm/dd/yyyy)",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width / 2,
                          height: 60,
                          child: PhysicalModel(
                            elevation: 10.0,
                            color: Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(25),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                labelText: 'Enter in the date...',
                                filled: true,
                                fillColor: Color(0xFFF4F4F4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: SafeArea(
                              child: Container(
                                child: ElevatedButton(
                                  child: Text(
                                    "Submit Goal",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  255, 145, 175, 241)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  onPressed: () {},
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
