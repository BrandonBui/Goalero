import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goalero/User%20Information/goal.dart';

class AppUser {
  final String realName;
  final String userName;
  final String bio;
  final int goalCount;
  final int badgeCount;
  final int friendCount;
  final List<goal> goalsList;

  AppUser(
      {required this.realName,
      required this.userName,
      required this.bio,
      required this.goalCount,
      required this.badgeCount,
      required this.friendCount,
      required this.goalsList});

  Map<dynamic, dynamic> toJson() => {
        'real name': realName,
        'username': userName,
        'bio': bio,
        'goal count': goalCount,
        'badge count': badgeCount,
        'friend count': friendCount,
        'goals': goalsList.toList()
      };

  static AppUser fromJson(Map<dynamic, dynamic>? json) => AppUser(
      realName: json!['real name'],
      userName: json['username'],
      bio: json['bio'],
      goalCount: json['goal count'],
      badgeCount: json['badge count'],
      friendCount: json['friend count'],
      goalsList: json['goals']);
}
