import 'package:flutter/material.dart';
import 'package:goalero/NavBarPages/add_goal_page.dart';
import 'package:goalero/NavBarPages/chat_page.dart';
import 'package:goalero/NavBarPages/trending_goals.dart';
import 'package:goalero/NavBarPages/user_profile_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
   int pageIndex = 0;
  
  final pages = [
    const DashboardPage(),
    const chat(),
    const addGoal(),
    const trendingGoals(),
    const profile()
  ];
  @override
  Widget build(BuildContext context) { //The onpressed code is just something I was experimenting with
    return Scaffold(
      backgroundColor: Color(0xFFF3F6F8),
      bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0XFF3F826D),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 8)

            )
          ]
        ),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex=0;
                });
              },
              icon: pageIndex ==0 ? Image.asset('images/homeIconSelected.png'):Image.asset('images/homeIcon.png') ,
            ),

            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex=1;
                });
              },
              icon: pageIndex ==1 ? Image.asset('images/chatIconSelected.png'):Image.asset('images/chatIcon.png') ,
            ),
            Transform.scale(
            scale: 2.5,
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex=2;
                });
              },
              icon: pageIndex ==2 ? Image.asset('images/addIcon.png', color: Color(0xFF53937E),):Image.asset('images/addIcon.png') ,
              padding: EdgeInsets.only(bottom: 10),
            )),

            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex=3;
                });
              },
              icon: pageIndex == 3 ? Icon(Icons.trending_up_rounded, color: Color(0xFF53937E),) : Icon(Icons.trending_up_rounded, color: Colors.black,) ,
            ),

            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex=4;
                });
              },
              icon: pageIndex ==4 ? Image.asset('images/profileSelected.png', color: Color(0xFF53937E),):Image.asset('images/profileIcon.png') ,
            ),
          ],
        ),
    )
    );
  }
}