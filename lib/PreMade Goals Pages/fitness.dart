import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_1.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class fitness extends StatelessWidget {
  final AppUser curUser;
  fitness({super.key, required this.curUser});

  List<Color> diffcolors = [
    Color(0xFF95D9FF),
    Color(0xFFC2ADFF),
    Color(0xFFB3F5FA),
    Color(0xFFE5C5FF),
    Color(0xFFB3FAE9),
    Color(0xFFC5CAFF),
  ];
  Color getColor(index) {
    if (index % 5 == 0) {
      return diffcolors[0];
    } else if (index % 5 == 1) {
      return diffcolors[1];
    } else if (index % 5 == 2) {
      return diffcolors[2];
    } else if (index % 5 == 3) {
      return diffcolors[3];
    } else if (index % 5 == 3) {
      return diffcolors[3];
    } else if (index % 5 == 4) {
      return diffcolors[4];
    } else {
      return diffcolors[5];
    }
  }

  List<String> premadeGoals = [
    "Gain Muscle",
    "Drink More Water",
    "Athletic Skill",
    "Lose Weight",
    "Try a New Workout"
  ];
  List<String> diffImages = [
    'images/tileImages/workingOut.svg',
    'images/tileImages/drink.svg',
    'images/tileImages/athleticSkill.svg',
    'images/tileImages/personalTrainer.svg',
    'images/tileImages/jogging.svg',
  ];
  @override
  Widget build(BuildContext context) {
    /**
     * goalCards
     * 
     * The following section builds each individual goal card.
     */
    Widget goalCards(index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: getColor(index),
                borderRadius: BorderRadius.circular(16),
              ),
              //POTENTIAL ERROR HERE IF ADDING NEW IMAGES! SEE COMMENT BELOW FOR SOLUTION
              child: SvgPicture.asset(diffImages[
                  index]), //you may have to flutter clean and then pub get when adding new images to not get an error of $key not recognized
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(premadeGoals[index],
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        );

    /**
     * Beginng of the page UI
     */
    return ScaffoldGradientBackground(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFE991FF),
            Color(0xFFCD9FFF),
            Color(0xFFB5AAFF),
            Color(0xFF9DB6FF),
            Color(0xFF7FD7FF),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0, left: 30.0),
                    child: GestureDetector(
                      child: const Icon(Icons.arrow_back_ios_new),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 60),
                    child: Text("Fitness Goals",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  //Beginning of the tiles on the page UI
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.builder(
                        itemCount: diffImages.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 8,
                          crossAxisCount: 2,
                          mainAxisExtent: 150,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          //This is the beginning of where the goal tiles with
                          //their gesture detectors are created
                          return GestureDetector(
                            child: goalCards(index),
                            onTap: () {
                              //The following if/else if statements define what
                              //happens when a tile is chosen
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GoalPageOne(
                                          currentGoal: premadeGoals[0],
                                          goalCategory: "Fitness",
                                          curUser: curUser),
                                    ));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GoalPageOne(
                                          currentGoal: premadeGoals[1],
                                          goalCategory: "Fitness",
                                          curUser: curUser),
                                    ));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GoalPageOne(
                                          currentGoal: premadeGoals[2],
                                          goalCategory: "Fitness",
                                          curUser: curUser),
                                    ));
                              } else if (index == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GoalPageOne(
                                          currentGoal: premadeGoals[3],
                                          goalCategory: "Fitness",
                                          curUser: curUser),
                                    ));
                              } else if (index == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GoalPageOne(
                                          currentGoal: premadeGoals[4],
                                          goalCategory: "Fitness",
                                          curUser: curUser),
                                    ));
                              }
                            },
                          );
                        },
                      )))
            ]),
          ]),
        ));
  }
}
