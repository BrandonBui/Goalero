import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_4_yes.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_4_no.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalPageFour extends StatefulWidget {
  final String goalCategory;
  final String currentGoal;
  final String goalDescription;
  final String goalDueDate;
  final AppUser curUser;
  const GoalPageFour(
      {required this.goalCategory,
      required this.currentGoal,
      required this.goalDescription,
      required this.goalDueDate,
      required this.curUser,
      super.key});

  @override
  State<GoalPageFour> createState() => _GoalPageFourState();
}

class _GoalPageFourState extends State<GoalPageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Probably add a dart board with dart icon here
                    const Text(
                      "Let's take a quick moment to reflect. Is your goal realistic?",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),

                    SizedBox(
                      height: 175,
                      width: 175,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Goal category
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.goalCategory,
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    //Goal title
                                    Text(
                                      widget.currentGoal,
                                      style: GoogleFonts.poppins(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),

                                    Divider(
                                      color: Colors.black,
                                      endIndent: 4,
                                    ),
                                    //Goal description
                                    Text(
                                      widget.goalDescription,
                                      style: GoogleFonts.poppins(),
                                      textAlign: TextAlign.center,
                                    ),

                                    Text(
                                      "Due: ${widget.goalDueDate}",
                                      style: GoogleFonts.poppins(),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
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

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Yes button
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //Change this to return the final question page
                                return GoalPageFourYes(
                                  goalCategory: widget.goalCategory,
                                  currentGoal: widget.currentGoal,
                                  goalDescription: widget.goalDescription,
                                  goalDueDate: widget.goalDueDate,
                                  curUser: widget.curUser,
                                );
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "Yes",
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

                        //No button
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //Change this to return the final question page
                                return GoalPageFourNo(
                                  curUser: widget.curUser,
                                  goalCategory: widget.goalCategory,
                                  currentGoal: widget.currentGoal,
                                  //currentGoal: widget.currentGoal
                                );
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "No",
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
                      ],
                    ),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
