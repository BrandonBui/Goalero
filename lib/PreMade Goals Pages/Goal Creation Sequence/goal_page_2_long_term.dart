import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_3.dart';

class GoalPageTwoLongTerm extends StatefulWidget {
  const GoalPageTwoLongTerm({super.key});

  @override
  State<GoalPageTwoLongTerm> createState() => _GoalPageTwoLongTermState();
}

class _GoalPageTwoLongTermState extends State<GoalPageTwoLongTerm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Current value of what you are tracking:"),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF3F6F8),
                      border: Border.all(
                        color: Color(0xFFD9E0E6),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: const TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.only(top: 15, left: 8),
                      border: InputBorder.none,
                      hintText: "ie. your current weight, grade, etc",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Goal value of what you are tracking:"),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF3F6F8),
                      border: Border.all(
                        color: Color(0xFFD9E0E6),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: const TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.only(top: 15, left: 8),
                      border: InputBorder.none,
                      hintText: "ie. your goal weight, grade, etc",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GoalPageThree(
                          currentGoal: 'Test',
                        );
                      }));
                    },
                    child: Container(
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
                  ),
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
