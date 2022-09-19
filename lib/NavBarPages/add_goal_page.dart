import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../specificAddGoal.dart';

class addGoal extends StatefulWidget {
  final AppUser curUser;

  const addGoal({Key? key, required this.curUser}) : super(key: key);

  @override
  State<addGoal> createState() => _addGoalState();
}

class _addGoalState extends State<addGoal> {
  final authUser = FirebaseAuth.instance.currentUser;

  /*

  */
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
    Color colorchange = Color.fromARGB(255, 0, 0, 0);
    int timeMessage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 0; //morning
    } else if (hour < 18) {
      return 1; //afternoon
    } else if (hour < 21) {
      return 2; //evening
    } else {
      return 3; //night
    }
  }
  List categories = [
    "Fitness",
    "Cooking",
    "Art",
    "Academic",
  ];
  List categoryImages = [
'images/running.png',
'images/cooking.png',
'images/art.png',
'images/cooking.png',
  ];
    var timesOfDay = [
    "Good Morning,",
    "Good Afternoon,",
    "Good Evening,",
    "Good Night,",
  ];
  @override
  Widget build(BuildContext context) {
    // ADD GOAL CARDS 
    Widget goalCards(index)=>Column(
          children: [Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration( //shadowing and background color of meeting cards
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(3, 3), // Shadow position
                      ),
                    ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:10.0, top: 15.0),
                        child: Text(categories[index],
                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Image(image: AssetImage(categoryImages[index]), fit: BoxFit.cover,),
                      )
                    ],
                  ),
                ),
                ],
    );
    //MAIN PAGE SETTINGS
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 65.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(timesOfDay[timeMessage()],
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                  ),
                  Container(
                    child: Text(
                      widget.curUser.realName,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                  child: SizedBox(
                    height: 500,
                    child: ListView.separated(
                      shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: goalCards(index),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const specificAddGoal()),);
                            },
                            );
                        },
                        //This is part of the ScrollSnapList package
                        itemCount: 4, 
                        scrollDirection: Axis.vertical, 
                        separatorBuilder: (context, index) { 
                          return const SizedBox(
                                height: 20.0, //** BETWEEN SPACING */
                              );
                         }, 
                         
                         //direction of scroll
                        )
                        ),
              ),
            ),

          ],
      ),
    ),);
  }
}
