import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goalero/User%20Information/goal.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: slash_for_doc_comments
/** 
 * The user profile class is used for displaying a users information on a
 * viewable page. This page can be used for the viewer themselfs or the
 * format can be applied to another user when viewing their profile. There
 * may be another page made with the edit button specifically but for now it
 * is one page.
 * 
 * The comments with the ** and capitial writing are the ones that can be changed
 * to reflect live user data changes from firebase. (Ex. Profile Picture, Name)
 * 
 * Now using generic types updated
 * June 2022.
 * 
 * @author Shayaz Pithawalla
 * @version 2.0
 * @since May 2022
 */

class profile extends StatefulWidget {
  final AppUser curUser;
  final List<Goal> goalList;
  const profile({Key? key, required this.curUser, required this.goalList})
      : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser!;

  Future SignOut() async {
    await FirebaseAuth.instance.signOut();
  }

/*
  Stream<AppUser> readUser() => FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots()
      .map((doc) => AppUser.fromJson(doc.data()));
*/
  @override
  Widget build(BuildContext context) {
    /*
    return StreamBuilder<AppUser>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong!');
          }
          if (snapshot.hasData) {
            final curUser = snapshot.data!;
*/
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 370, //width of the overall container
                child: Stack(
                  children: [
                    Positioned(
                      right:
                          5, // controls the positioning of the yellow rectangle
                      left: 100,
                      bottom: 18,

                      child: Container(
                        //yellow rectangle
                        height: 120, //size of the rect
                        width: 550,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(2, 2)),
                            BoxShadow(
                                color: Color.fromARGB(255, 241, 240, 240),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(-2, -2)),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.curUser.realName,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text('\"' + widget.curUser.bio + '\"')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      // profile picture, background and shadow
                      borderRadius: BorderRadius.circular(180),
                      elevation: 5,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: NetworkImage(
                              "https://bit.ly/3La7fSd"), //** USER IMAGE
                        ),
                      ),
                    ),
                    Positioned(
                        child: SizedBox(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/editProfile");
                                },
                                icon: Icon(Icons.edit))),
                        right: 4,
                        top: 90
                        ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.curUser.goalCount.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Goals",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.curUser.badgeCount.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Badges",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.curUser.friendCount.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Friends",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                  ],
                ),
              ),
              Column(
                // your goals
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Your Goals",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 195),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 210,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(12),
                            itemBuilder: (context, index) => buildCard(index),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 12.0, //** BETWEEN SPACING */
                              );
                            },
                            itemCount: widget.curUser.goalCount,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                // your goals
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Your Posts",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 195),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 210,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(12),
                            itemBuilder: (context, index) => buildCard(index),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 12.0, //** BETWEEN SPACING */
                              );
                            },
                            itemCount: widget.curUser.goalCount,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => SignOut(),
                child: Text(
                  "Sign Out\n" + user.email!,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCard(int index) => Stack(
        children: [
          /*
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              
              child: Image.network(
                'https://source.unsplash.com/random?sig=$index', //** IMAGE HERE */
                height: 150, //** BOX HEIGHT */
                width: 150, //** BOX WIDTH */
                fit: BoxFit.cover,
              ),
              */
          Center(
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 130, 112, 230),
                            spreadRadius: 2.0,
                            blurRadius: 4,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            //Goal category

                            Text(
                              widget.goalList[index].goalCategory.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),

                            Icon(Icons.wifi_1_bar_outlined),
                          ]),

                          //Goal title
                          Text(
                            widget.goalList[index].goalName.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          //Goal description
                          Text(
                              widget.goalList[index].goalDesctiption.toString())
                        ],
                      ),
                    ),
                  ))),
          /*
            ),
            const SizedBox(height: 8),
            Text(goal.goalName), //**IMAGE CAPTION TEXT */

            */
        ],
      );
  /*else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          */
}
        //);
 // }
//}
