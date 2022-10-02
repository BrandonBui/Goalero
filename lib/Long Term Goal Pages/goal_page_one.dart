import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goalero/Long%20Term%20Goal%20Pages/goal_page_four.dart';
import 'package:goalero/Long%20Term%20Goal%20Pages/goal_page_two_long_term.dart';
import 'package:goalero/Long%20Term%20Goal%20Pages/goal_page_two_recurring.dart';

class GoalPageOne extends StatefulWidget {
  final String goalNumber;
  final String currentGoal;
  const GoalPageOne(
      {required this.goalNumber, required this.currentGoal, super.key});

  @override
  State<GoalPageOne> createState() => _GoalPageOneState();
}

class _GoalPageOneState extends State<GoalPageOne> {
  //Creates a list of numbers that will be used in the number scroller
  List<int> numberScrollerNumbers = new List<int>.generate(999, (k) => k + 1);

  //This variable is used to display the Number option menu
  bool showNum = false;

  //Variables that will be tracked to send to next page
  String newGoal = "";
  late int startVal;
  late int goalVal;

  String actionPhrasePicker(String goal) {
    String actionPhrase;
    switch (goal) {
      case "Lose Weight":
        actionPhrase = "weight";
        break;
      case "Gain Muscle":
        actionPhrase = "I want to gain";
        break;
      case "Improve your grades":
        actionPhrase = "I want to raise my";
        break;
      case "Excel in class":
        actionPhrase = "I want to raise my grade in";
        break;
      default:
        actionPhrase = "Error";
    }
    return actionPhrase;
  }

  void VisibilityChange(bool input) {
    input = !input;
  }

  @override
  Widget build(BuildContext context) {
    //This variable is used to track the width of the phone screen
    double screenWidth = MediaQuery.of(context).size.width;

    double tileGap = 20;

    return Scaffold(
        body: Container(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("I want to ${widget.currentGoal}",
                style: const TextStyle(fontSize: 24)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "This is your goal so far. Let's dig deeper and make your goal measurable. What type of target do you want to use?",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: tileGap,
                mainAxisSpacing: tileGap,
                children: [
                  //#### Long term gesture controller ####
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GoalPageTwoLongTerm();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF3f826d),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF3f826d))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Long Term",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Have a start value that you are at now and a goal value you wish to reach. Track your progress along the way.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //#### Done or Not Done gesture controller ####
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GoalPageFour(
                          currentGoal: widget.currentGoal,
                          goalCount: widget.goalNumber,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Done or Not",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "You have accomplished your goal or you have not.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //#### Currency gesture controller ####
                  /*
                  GestureDetector(
                    onTap: () {
                      showNum = !showNum;
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF3f826d),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF3f826d))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Currency",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Money related goals such as budgeting or saving a certain amount.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  */
                  //#### Recurring gesture detector ####
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GoalPageTwoRecurring();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF3f826d),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF3f826d))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Recurring",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "You do something a certain amount of times over a repeating time period (day/week/month/etc.)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),

      /*
                    Container(
                      width: 60,
                      height: 100,
                      child: Center(
                        child: CupertinoPicker(
                            scrollController:
                                FixedExtentScrollController(initialItem: 99),
                            looping: true,
                            itemExtent: 30,
                            onSelectedItemChanged: (index) {
                              goalVal = index;
                            },
                            children: [
                              for (var i in numberScrollerNumbers)
                                Text(
                                  i.toString(),
                                  style: TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                )
                            ]),
                      ),
                    ),
                    
                    Container(
                      width: 60,
                      height: 100,
                      child: Center(
                        child: CupertinoPicker(
                            itemExtent: 30,
                            onSelectedItemChanged: (index) {},
                            children: [
                              Text(
                                "lbs",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "kg",
                                style: TextStyle(fontSize: 24),
                              )
                            ]),
                      ),
                    ),
                    */
    )));
  }
}
