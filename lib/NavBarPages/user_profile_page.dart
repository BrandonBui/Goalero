import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    //Temporary sign out function that can be activated by clicking hte profile
    //page text
    Future SignOut() async {
      await FirebaseAuth.instance.signOut();
    }

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
                    left: 55,
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
                        backgroundImage: NetworkImage("https://bit.ly/3La7fSd"), //** USER IMAGE
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30, ),
            TextButton(
              onPressed: () => SignOut(),
              child: const Text(
                "Sign Out",
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
  }
} //green