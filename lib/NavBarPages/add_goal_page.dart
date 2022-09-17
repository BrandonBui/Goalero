import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';

class addGoal extends StatefulWidget {
  final AppUser curUser;

  const addGoal({Key? key, required this.curUser}) : super(key: key);

  @override
  State<addGoal> createState() => _addGoalState();
}

class _addGoalState extends State<addGoal> {
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
