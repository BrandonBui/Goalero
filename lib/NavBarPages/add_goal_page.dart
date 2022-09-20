import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';

class addGoal extends StatefulWidget {
  final AppUser curUser;

  const addGoal({Key? key, required this.curUser}) : super(key: key);

  @override
  State<addGoal> createState() => _addGoalState();
}

class _addGoalState extends State<addGoal> {
  final authUser = FirebaseAuth.instance.currentUser;

  /*
  addNewGoal

  Communicated to the firestore database to store the goal information inside of
  a collection created within the user's document.
  */
  Future addNewGoal(String goalName, String goalCategory,
      String goalDescription, String goalCompletionDate) async {
    int goalNumber = widget.curUser.goalCount + 1;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(authUser!.uid)
        .collection("goals")
        .doc("goal$goalNumber")
        .set({
      "goal name": goalName,
      "goal category": goalCategory,
      "goal description": goalDescription,
      "goal completion date": goalCompletionDate
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: Colors.black,
        shadowColor: Color(0XFF3F826D),
        elevation: 20,
        title: Text("Create A Goal!"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF3F6F8),
        child: Center(
          child: Text(
            "Goals Page",
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 45,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
