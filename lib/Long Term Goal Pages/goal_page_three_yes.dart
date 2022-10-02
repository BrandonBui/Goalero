import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goalero/Long%20Term%20Goal%20Pages/goal_page_four.dart';

class GoalPageThreeYes extends StatefulWidget {
  final String currentGoal;
  final String goalCount;
  const GoalPageThreeYes(
      {required this.currentGoal, required this.goalCount, super.key});

  @override
  State<GoalPageThreeYes> createState() => _GoalPageThreeYesState();
}

class _GoalPageThreeYesState extends State<GoalPageThreeYes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Column(
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
                          return GoalPageFour(
                            goalCount: widget.goalCount,
                            //currentGoal: widget.currentGoal
                            currentGoal: "I want to lose 10 pounds by",
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
            )),
      ),
    );
  }
}
