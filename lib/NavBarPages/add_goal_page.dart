import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/PreMade%20Goals%20Pages/art.dart';
import 'package:goalero/PreMade%20Goals%20Pages/cooking.dart';
import 'package:goalero/PreMade%20Goals%20Pages/fitness.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../PreMade Goals Pages/academic.dart';
import '../customAddGoal.dart';

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

    Color colorchange = Color.fromARGB(255, 0, 0, 0);
    int timeMessage() {

    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 0; //morning
    } else if (hour < 18) {
      return 1; //afternoon
    } else if (hour < 21) {
      return 2; //evening
    } else {
      return 3; //night
    }
  }

  List categories = [
    "Fitness",
    "Cooking",
    "Art",
    "Academic",
  ];
  List categoryImages = [

'images/running.png',
'images/cooking.png',
'images/art.png',
'images/education.png',

  ];
  var timesOfDay = [
    "Good Morning,",
    "Good Afternoon,",
    "Good Evening,",
    "Good Night,",
  ];
  @override
  Widget build(BuildContext context) {
    // ADD GOAL CARDS
    Widget goalCards(index) => Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  //shadowing and background color of meeting cards
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(3, 3), // Shadow position
                    ),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                    child: Text(categories[index],
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Image(
                      image: AssetImage(categoryImages[index]),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
    //MAIN PAGE SETTINGS
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 70.0),
               child: SafeArea(
                 child: Align(
                  alignment: Alignment.topCenter,
                  child: Text("Pick a Category", style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                  /*child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(timesOfDay[timeMessage()],
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        child: Text(
                          widget.curUser.realName,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),*/
                           ),
               ),
             ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 20.0),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: Image.asset('images/editIcon.png'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => customAddGoal(widget.curUser)),);
                    },
                    ), 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: SizedBox(
                    height: 500,
                    child: ListView.separated(
                      shrinkWrap: true,

                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: goalCards(index),
                            onTap: () {
                              
                              print(categories[index]); //for debugging purposes
                              if (index ==0){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => fitness(),));
                              } else if (index ==1){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => cooking(),));
                              } else if (index ==2){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => art(),));
                              }else if (index ==3){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => academic(),));
                              }
                              
                            },

                            );
                          },
                        );
                      },
                      //This is part of the ScrollSnapList package
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20.0, //** BETWEEN SPACING */
                        );
                      },

                      //direction of scroll
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

}