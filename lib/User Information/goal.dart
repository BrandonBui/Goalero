import 'package:flutter/foundation.dart';

class Goal {
  final String goalName;
  //final String goalCategory;
  //final String goalDesctiption;
  //final String goalCompletionDate;

  Goal({
    required this.goalName,
    //required this.goalCategory,
    //required this.goalDesctiption,
    //required this.goalCompletionDate
  });

  static Goal fromJson(Map<String, dynamic> json) =>
      Goal(goalName: json['goal name']);
}
