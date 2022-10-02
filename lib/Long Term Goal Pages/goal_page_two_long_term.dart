import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

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
            child: Center(
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
            ],
          ),
        )),
      ),
    );
  }
}
