import 'package:flutter/material.dart';

class addGoal extends StatelessWidget {
  const addGoal({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}