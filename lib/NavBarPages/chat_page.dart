import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';

class chat extends StatefulWidget {
  final AppUser curUser;

  const chat({Key? key, required this.curUser}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Chat Page",
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
