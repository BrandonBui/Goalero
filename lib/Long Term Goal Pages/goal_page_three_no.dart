import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goalero/Long%20Term%20Goal%20Pages/goal_page_one.dart';

class GoalPageThreeNo extends StatefulWidget {
  final String goalCount;
  const GoalPageThreeNo({required this.goalCount, super.key});

  @override
  State<GoalPageThreeNo> createState() => _GoalPageThreeNoState();
}

class _GoalPageThreeNoState extends State<GoalPageThreeNo> {
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
                    "It's ok! We'll take you back to make some changes.",
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
                          return GoalPageOne(
                            currentGoal: "Lose weight",
                            goalNumber: widget.goalCount,
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
