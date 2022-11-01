import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_3.dart';
import 'package:goalero/User%20Information/app_user.dart';

class GoalPageTwoRecurring extends StatefulWidget {
  final goalCategory;
  final currentGoal;
  final AppUser curUser;
  const GoalPageTwoRecurring(
      {required this.goalCategory,
      required this.currentGoal,
      super.key,
      required this.curUser});

  @override
  State<GoalPageTwoRecurring> createState() => _GoalPageTwoRecurringState();
}

class _GoalPageTwoRecurringState extends State<GoalPageTwoRecurring> {
  final numberController = FixedExtentScrollController(initialItem: 0);

  String createGoalDescription() {
    String goalDescriptionReturn =
        "${amountOfTimesSelection + 1} times per ${timePeriods[timePeriodSelection].data}";
    return goalDescriptionReturn;
  }

  bool selectionsVerified() {
    if (timePeriodSelection != 0) {
      return true;
    } else {
      return false;
    }
  }

  int timePeriodSelection = 0;
  late int amountOfTimesSelection = 0;
  String errorMessage = "";

  List<Text> timePeriods = [
    const Text("Select a Time Period"),
    const Text("Day"),
    const Text("Week"),
    const Text("Month"),
    const Text("Year")
  ];

  List<Text> scrollerNumbers =
      List<Text>.generate(100, (index) => Text((index + 1).toString()));

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
                const Text(
                  "How many times are you trying to do this activity per day/week/month/year?",
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 60,
                  height: 100,
                  child: Center(
                    child: CupertinoPicker(
                        scrollController: numberController,
                        itemExtent: 30,
                        onSelectedItemChanged: (index) {
                          amountOfTimesSelection = index;
                        },
                        children: scrollerNumbers as List<Widget>),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("times per:", style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                Container(
                  width: 175,
                  height: 100,
                  child: Center(
                    child: CupertinoPicker(
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        itemExtent: 30,
                        onSelectedItemChanged: (index) {
                          timePeriodSelection = index;
                        },
                        children: timePeriods as List<Widget>),
                  ),
                ),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (selectionsVerified()) {
                        setState(() {
                          errorMessage = "";
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return GoalPageThree(
                            currentGoal: widget.currentGoal,
                            goalCategory: widget.goalCategory,
                            goalDescription: createGoalDescription(),
                            curUser: widget.curUser,
                          );
                        }));
                      } else {
                        setState(() {
                          errorMessage = "Please complete all the fields";
                        });
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
        ])),
      ),
    );
  }
}
