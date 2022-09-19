import 'package:flutter/material.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:goalero/User%20Information/goal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class home extends StatefulWidget {
  final AppUser curUser;
  final List<Goal> goalList;
  const home({Key? key, required this.curUser, required this.goalList})
      : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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

  //box scroller settings
  double boxHeight = 150.0;
  double boxWidth = 150.0;
  double betweenSpacing = 12.0;
  String titleText = "Hello";
  String underCardText = "Food";

  List meetingUser = [
    "images/sampleProfileImage.jpg",
    "images/sampleProfileImage2.jpg",
  ];
  List meetingContent = [
    "Power Lifting for Kids",
    "Training Monkeys",
  ];
  List timings = ["10:00 AM to 10:30 AM", "1:00 PM : 2:00PM"];
  var timesOfDay = [
    "Good Morning,",
    "Good Afternoon,",
    "Good Evening,",
    "Good Night,",
  ];
  @override
  Widget build(BuildContext context) {
    //GOAL CARD WIDGET BUILDER
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
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child:
                              Text(widget.goalList[index].goalName.toString()),
                        )))),
            /*
            ),
            const SizedBox(height: 8),
            Text(goal.goalName), //**IMAGE CAPTION TEXT */

            */
          ],
        );

    Widget buildGoal(Goal goal) => ListTile(
          title: Text(goal.goalName),
        );

    //MEETINGS CARDS WIDGET BUILDER
    Widget meetingCards(int index) => Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration( //shadowing and background color of meeting cards
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(meetingUser[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //entire padding for text in upcoming meetings
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  meetingContent[index],
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    timings[index],
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Image(image: AssetImage('images/UserIdBlob.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 65.0),
              child: Column(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 30.0),
              child: Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: Container(
                      child: GestureDetector(
                    child: ImageIcon(
                      AssetImage('images/notification.png'),
                      color: Colors.black,
                    ),
                  )),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1, -.3),
              child: Padding(
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
                    SizedBox(width: MediaQuery.of(context).size.width - 195),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 210,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(12),
                          itemBuilder: (context, index) => buildCard(index),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: betweenSpacing, //** BETWEEN SPACING */
                            );
                          },
                          itemCount: widget.curUser.goalCount,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            RotationTransition(
              //bottom blob is slightly rotated
              turns: AlwaysStoppedAnimation(15 / 360),
              child: Container(
                child: Transform.scale(
                    scale: 1.8,
                    alignment: Alignment(-1.5, -4),
                    child: Image(image: AssetImage('images/SideBlob.png'))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Align(
                alignment: Alignment(-1.1, 0.4),
                child: Container(
                  child: Text(
                    "Upcoming Meetings",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: SizedBox(
                  height: 100,
                  child: ScrollSnapList(
                    itemBuilder: (context, index) {
                      return meetingCards(index);
                    },
                    //This is part of the ScrollSnapList package
                    itemCount: meetingContent.length,
                    dynamicItemSize: true, //makes it snap
                    itemSize: 100, //how fast the scroll is
                    onItemFocus: (index) {},
                    scrollDirection: Axis.vertical, //direction of scroll
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
