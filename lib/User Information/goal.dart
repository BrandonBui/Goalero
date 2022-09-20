import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Goal {
  final String goalName;
  final String goalCategory;
  final String goalDesctiption;
  final Timestamp goalCompletionDate;

  Goal(
      {required this.goalName,
      required this.goalCategory,
      required this.goalDesctiption,
      required this.goalCompletionDate});

  static Goal fromJson(Map<dynamic, dynamic> json) => Goal(
      goalName: json['goal name'],
      goalCategory: json['goal category'],
      goalDesctiption: json['goal description'],
      goalCompletionDate: json['goal completion date']);
}
