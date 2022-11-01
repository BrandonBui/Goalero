import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:goalero/customGoalPages/goalType.dart';
import 'package:google_fonts/google_fonts.dart';

class customAddGoalLanding extends StatelessWidget {
  const customAddGoalLanding({super.key});
/*
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
*/
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //final args = ModalRoute.of(context)!.settings.arguments as specificAddGoal;
    return Scaffold(
        body: SingleChildScrollView(
      //to make page scrollable
      child: Column(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight, //to make gradient
                    colors: [
                  //background gradient
                  Color(0xFFC5A1FF),
                  Color(0xFFB2ACFF),
                  Color(0xFF9CB7FF),
                  Color(0xFF8BC0FF),
                  Color(0xFF81C9FF),
                  Color(0xFF7ED2FF),
                  Color(0xFF80D8FF),
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
                        Navigator.pop(context); //go back to previous page
                      },
                    ),
                  ),
                ),
              ),
              Column(
                //align everything except back arrow in column
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height /
                              6), //take up 1/6th of the screen's height
                      child: SafeArea(
                        child: Text("Custom Goal",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      child: SvgPicture.asset('images/customPic.svg'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                    child: Text(
                      "Let's create a goal personalized for you!",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      height: 50, //height of button
                      width: 200, //width of button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => goalType()));
                        },
                        child: Text("Next",
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xFF834ADF)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 138, 97, 233)),
                        ),
                      ),
                    ),
                  )
                ], //end of Column's children
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
