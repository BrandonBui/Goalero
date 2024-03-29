import 'package:flutter/material.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_1.dart';
import 'package:goalero/User%20Information/app_user.dart';

class GoalPageFourNo extends StatefulWidget {
  final String goalCategory;
  final String currentGoal;
  final AppUser curUser;
  const GoalPageFourNo({
    super.key,
    required this.curUser,
    required this.goalCategory,
    required this.currentGoal,
  });

  @override
  State<GoalPageFourNo> createState() => _GoalPageFourNoState();
}

class _GoalPageFourNoState extends State<GoalPageFourNo> {
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
                              currentGoal: widget.currentGoal,
                              goalCategory: widget.goalCategory,
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
