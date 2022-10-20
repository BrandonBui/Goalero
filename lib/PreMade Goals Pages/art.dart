import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class art extends StatelessWidget {
  art({super.key});

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
    "Different art style",
    "Increase art following",
    "Draw Daily",
    "New art medium",
  ];
  List<String> diffImages = [
    'images/tileImages/characterDrawing.svg',
    'images/tileImages/present.svg',
    'images/tileImages/digitalDrawing.svg',
    'images/tileImages/newMedium.svg',
  ];
  @override
  Widget build(BuildContext context) {
    /**
     * This section of code builds the goal tile cards
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Center(
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
     * This is the beginning of the main page UI
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
          child: Stack(
        children: [
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
                  child: Text("Art Goals",
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                    itemCount: diffImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 8,
                      crossAxisCount: 2,
                      mainAxisExtent: 160,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        child: goalCards(index),
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GoalPageOne(
                                      currentGoal: premadeGoals[0],
                                      goalCategory: "Art"),
                                ));
                          } else if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GoalPageOne(
                                      currentGoal: premadeGoals[1],
                                      goalCategory: "Art"),
                                ));
                          } else if (index == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GoalPageOne(
                                      currentGoal: premadeGoals[2],
                                      goalCategory: "Art"),
                                ));
                          } else if (index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GoalPageOne(
                                      currentGoal: premadeGoals[3],
                                      goalCategory: "Art"),
                                ));
                          }
                        },
                      );
                    }),
              ),
            )
          ]),
        ],
      )),
    );
  }
}
