import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_4_yes.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_1.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_4_no.dart';

class GoalPageFour extends StatefulWidget {
  const GoalPageFour({super.key});

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
                    Text(
                      "Let's take a quick moment to reflect. Is your goal realistic?",
                      textAlign: TextAlign.center,
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
                                    currentGoal: 'Test', goalCount: 'Test');
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
                                  goalCount: "test",
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
