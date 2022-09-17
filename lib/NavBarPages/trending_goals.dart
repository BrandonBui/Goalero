import 'package:flutter/material.dart';
import 'package:goalero/app_user.dart';

class trendingGoals extends StatefulWidget {
  final AppUser curUser;

  const trendingGoals({Key? key, required this.curUser}) : super(key: key);

  @override
  State<trendingGoals> createState() => _trendingGoalsState();
}

class _trendingGoalsState extends State<trendingGoals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Trending Goals Page",
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
