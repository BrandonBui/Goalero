import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_5.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_3.dart';

class GoalPageFourYes extends StatefulWidget {
  final String currentGoal;
  final String goalCount;
  const GoalPageFourYes(
      {required this.currentGoal, required this.goalCount, super.key});

  @override
  State<GoalPageFourYes> createState() => _GoalPageFourYesState();
}

class _GoalPageFourYesState extends State<GoalPageFourYes> {
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
                      "Great job! You're almost there. Click next to go onto the final question.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            //Change this to return the final question page
                            return GoalPageFive(
                                finalGoal: 'test', actionWord: 'test');
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(15)),
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
                      ),
                    ),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
