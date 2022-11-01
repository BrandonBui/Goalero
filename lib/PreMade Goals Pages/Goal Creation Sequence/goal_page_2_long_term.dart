import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_3.dart';
import 'package:goalero/User%20Information/app_user.dart';

class GoalPageTwoLongTerm extends StatefulWidget {
  final goalCategory;
  final currentGoal;
  final AppUser curUser;
  const GoalPageTwoLongTerm(
      {required this.goalCategory,
      required this.currentGoal,
      super.key,
      required this.curUser});

  @override
  State<GoalPageTwoLongTerm> createState() => _GoalPageTwoLongTermState();
}

class _GoalPageTwoLongTermState extends State<GoalPageTwoLongTerm> {
  final formKey = GlobalKey<FormState>();
  //Text Editing Controllers for the current value input and goal value input
  final curValController = TextEditingController();
  final goalValController = TextEditingController();

  String createGoalDescription() {
    String desc =
        "Current${valueReplacement()}${curValController.text}\nGoal${valueReplacement()}${goalValController.text}";
    return desc;
  }

  String valueReplacement() {
    if (widget.currentGoal == "Lose Weight") {
      return " Weight: ";
    } else {
      return " Value: ";
    }
  }

  String sentenceEndingReplacement() {
    if (widget.currentGoal == "Lose Weight") {
      return " weight?";
    } else {
      return " value of what you are tracking?";
    }
  }

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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //The folowing sections asks user for the current value of what they are tracking
                  //Question text above first text field
                  Text(
                    "What is your current/starting${sentenceEndingReplacement()}",
                    textAlign: TextAlign.center,
                  ),
                  //Textfield
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F6F8),
                        border: Border.all(
                          color: Color(0xFFD9E0E6),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    //Text entry field
                    child: TextFormField(
                        controller: curValController,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.only(top: 15, left: 8),
                          border: InputBorder.none,
                          hintText: "ie. your current weight, grade, etc",
                        ),
                        textAlign: TextAlign.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (curValue) {
                          if (curValue == "") {
                            return "Please enter a valid input.";
                          } else {
                            return null;
                          }
                        }),
                  ),

                  //Box for spacing
                  const SizedBox(height: 20),

                  //The following section asks user for the goal value of what
                  //they are tracking
                  //Question above second text field
                  Text("What is your goal${sentenceEndingReplacement()}"),

                  //Second textfield
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F6F8),
                        border: Border.all(
                          color: Color(0xFFD9E0E6),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    //textfield
                    child: TextFormField(
                        controller: goalValController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "ie. your goal weight, grade, etc",
                        ),
                        textAlign: TextAlign.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (goalVal) {
                          if (goalVal == "") {
                            return "Please enter a valid input.";
                          } else {
                            return null;
                          }
                        }),
                  ),

                  //Box for spacing
                  const SizedBox(height: 20),

                  //Beginning of the button code
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return GoalPageThree(
                              goalCategory: widget.goalCategory,
                              currentGoal: "I want to ${widget.currentGoal}",
                              goalDescription: createGoalDescription(),
                              curUser: widget.curUser,
                            );
                          }));
                        }
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
          ),
        ])),
      ),
    );
  }
}
