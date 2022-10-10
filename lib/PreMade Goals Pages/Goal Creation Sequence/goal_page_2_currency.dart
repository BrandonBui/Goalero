import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//To be continued later

class GoalPageTwoCurrency extends StatefulWidget {
  const GoalPageTwoCurrency({super.key});

  @override
  State<GoalPageTwoCurrency> createState() => _GoalPageTwoCurrencyState();
}

class _GoalPageTwoCurrencyState extends State<GoalPageTwoCurrency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "How many times are you trying to do this activity per day/week/month/year?"),
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
                    hintText: "Please enter a number.",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Select a time period:"),
              Container(
                width: 150,
                height: 100,
                child: Center(
                  child: CupertinoPicker(
                      scrollController:
                          FixedExtentScrollController(initialItem: 99),
                      itemExtent: 30,
                      onSelectedItemChanged: (index) {
                        //timePeriodSelection = index;
                      },
                      children: const [
                        Text("Day"),
                        Text("Week"),
                        Text("Month"),
                        Text("Year")
                      ]),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
