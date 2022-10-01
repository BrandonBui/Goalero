import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalPageFour extends StatefulWidget {
  final String currentGoal;
  final String goalCount;
  const GoalPageFour({
    required this.currentGoal,
    required this.goalCount,
    Key? key,
  }) : super(key: key);

  @override
  State<GoalPageFour> createState() => _GoalPageFourState();
}

class _GoalPageFourState extends State<GoalPageFour> {
  late double height;
  late double width;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  String dateAsString = "";
  //String dateTime = DateFormat.yMd().format(DateTime.now());
  late String _setTime, _setDate;

  TextEditingController dateController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  // Select for Date
  Future _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: dateTime,
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }

    dateController.text = DateFormat.yMd().format(selectedDate);

    /*
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('goals')
        .doc(widget.goalCount)
        .set({'due date': selectedDate});
        */
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Last question! When do you want to complete your goal by?",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: width / 1.7,
                    height: height / 9,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      controller: dateController,
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      onSaved: (String? val) {
                        _setDate = val!;
                      },
                      decoration: const InputDecoration(
                          hintText: "Click here to select date",
                          hintStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
