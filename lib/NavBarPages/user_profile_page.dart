import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/app_user.dart';
import 'package:provider/provider.dart';

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
  const profile({super.key});

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

  final User = FirebaseAuth.instance.currentUser;

  Stream<AppUser> readUser() => FirebaseFirestore.instance
      .collection('users')
      .doc(User!.uid)
      .snapshots()
      .map((doc) => AppUser.fromJson(doc.data()));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong!');
          }
          if (snapshot.hasData) {
            final curUser = snapshot.data!;

            return SafeArea(
              child: Scaffold(
                  body: Center(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
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
                                      curUser.realName,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Text('\"' + curUser.bio + '\"')
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
                                curUser.goalCount.toString(),
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
                                curUser.badgeCount.toString(),
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
                                curUser.friendCount.toString(),
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
              )),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
