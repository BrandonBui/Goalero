import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:goalero/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GoalPageFive extends StatefulWidget {
  final String goalCategory;
  final String currentGoal;
  final String goalDescription;
  final String goalDueDate;
  final AppUser curUser;

  const GoalPageFive(
      {super.key,
      required this.goalCategory,
      required this.currentGoal,
      required this.goalDescription,
      required this.goalDueDate,
      required this.curUser});

  @override
  State<GoalPageFive> createState() => _GoalPageFiveState();
}

class _GoalPageFiveState extends State<GoalPageFive> {
  //Text controllers to track edits
  TextEditingController goalCategoryController = TextEditingController();
  TextEditingController currentGoalController = TextEditingController();
  TextEditingController goalDescriptionController = TextEditingController();
  TextEditingController goalDueDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  final authUser = FirebaseAuth.instance.currentUser;

  /// addNewGoal(String goalName, String goalCategory)
  ///
  ///
  ///
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

  Future _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: dateTime,
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }

    goalDueDateController.text = DateFormat.yMd().format(selectedDate);

    /*
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('goals')
        .doc(widget.goalCount)
        .set({'due date': selectedDate});
        */
  }

  void initState() {
    goalCategoryController.text = widget.goalCategory;
    currentGoalController.text = widget.currentGoal;
    goalDescriptionController.text = widget.goalDescription;
    goalDueDateController.text = widget.goalDueDate;
  }

  late int startVal;
  late int goalVal;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Intro text
              const Text(
                "Here is your final goal! You can make edits, or click add goal.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5), //Sized box for spacing
              Text(
                "To make edits: click on any text you would like to change.",
                style: GoogleFonts.poppins(fontSize: 10),
              ),
              const SizedBox(
                height: 75,
              ), //Sized box for spacing
              SizedBox(
                height: 200,
                width: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 130, 112, 230),
                          spreadRadius: 2.0,
                          blurRadius: 4,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //#### Goal category textfield ####
                                Container(
                                  height: 20,
                                  child: TextField(
                                    controller: goalCategoryController,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),

                                //#### Current goal textfield ####
                                Container(
                                  height: 20,
                                  child: TextField(
                                    controller: currentGoalController,
                                    style: GoogleFonts.poppins(fontSize: 16),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),

                                const Divider(
                                  color: Colors.black,
                                  endIndent: 4,
                                ),

                                //#### Goal description textfield ####
                                Container(
                                  transform:
                                      Matrix4.translationValues(0, -10, 0),
                                  child: TextField(
                                    maxLines: 3,
                                    //maxLength: 70, //Would like to eventually implement this but creates too much white space
                                    controller: goalDescriptionController,
                                    style: GoogleFonts.poppins(fontSize: 14),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),

                                Container(
                                  transform:
                                      Matrix4.translationValues(0, -30, 0),
                                  child: TextButton(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    child: Text(
                                      "Due: ${widget.goalDueDate}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          "images/goalTileIcons/RunningPersonIcon.svg",
                          alignment: Alignment.topRight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Sized box for spacing
              const SizedBox(
                height: 75,
              ),

              //#### Next Button ####
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(0xFF3f826d),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF3f826d))),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
