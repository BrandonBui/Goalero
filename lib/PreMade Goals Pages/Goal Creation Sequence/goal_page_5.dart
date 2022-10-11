import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GoalPageFive extends StatefulWidget {
  final String finalGoal;
  final String actionWord;
  const GoalPageFive(
      {required this.finalGoal, required this.actionWord, super.key});

  @override
  State<GoalPageFive> createState() => _GoalPageFiveState();
}

class _GoalPageFiveState extends State<GoalPageFive> {
  List<int> numberScrollerNumbers = new List<int>.generate(999, (k) => k + 1);

  late int startVal;
  late int goalVal;

  @override
  Widget build(BuildContext context) {
    TextEditingController finalGoalController =
        TextEditingController(text: widget.finalGoal);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                  "Here is your final goal, you can make edits, or click add goal!"),
              Container(
                width: width / 1.7,
                decoration: BoxDecoration(
                    color: Color(0xFFF3F6F8),
                    border: Border.all(
                      color: Color(0xFFD9E0E6),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: finalGoalController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Text("Current ${widget.actionWord}"),
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
                            startVal = index;
                          },
                          children: [
                            for (var i in numberScrollerNumbers)
                              Text(
                                i.toString(),
                                style: const TextStyle(fontSize: 24),
                                textAlign: TextAlign.center,
                              )
                          ]),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
