import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goalero/Authentication%20Pages/main_page2.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_5.dart';
import 'package:goalero/NavBarPages/add_goal_page.dart';
import 'package:goalero/NavBarPages/chat_page.dart';
import 'package:goalero/NavBarPages/edit_user_profile_page.dart';
import 'package:goalero/NavBarPages/trending_goals.dart';
import 'package:goalero/NavBarPages/user_profile_page.dart';
import 'package:goalero/Authentication Pages/main_page.dart';
import 'package:goalero/User%20Information/app_user.dart';
import 'package:goalero/User%20Information/goal.dart';
import 'package:goalero/PreMade%20Goals%20Pages/Goal%20Creation%20Sequence/goal_page_1.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Authentication Pages/login_page.dart';
import 'Authentication Pages/signup_page.dart';
// import "./logo_loading.dart";
import 'landing_page.dart';
import 'NavBarPages/home_page.dart';
import 'NavBarPages/add_goal_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp()); //myApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: "/MainPage2",
      routes: {
        "/landingPage": (context) => const LandingPage(),
        "/MainPage": (context) => MainPage(),
        "/MainPage2": (context) => MainPage2(),
        "/editProfile": (context) => editProfile(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    );

    //controller.repeat();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_bubble_outline_rounded,
          color: Colors.black,
        ),
        label: 'Chat'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.hourglass_empty,
          color: Colors.white,
        ),
        label: 'Add'),
    const BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(),
          child: Icon(
            Icons.trending_up_rounded,
            color: Colors.black,
          ),
        ),
        label: 'Trending'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_outlined,
          color: Colors.black,
        ),
        label: 'Profile'),
  ];
  final user = FirebaseAuth.instance.currentUser!;

  Stream<AppUser> readUser() => FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots()
      .map((doc) => AppUser.fromJson(doc.data()));

  Stream<List<Goal>> getGoals() => FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('goals')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Goal.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text('Something went wrong!'));
          }
          if (snapshot.hasData) {
            final curUser = snapshot.data!;

            return StreamBuilder<List<Goal>>(
                stream: getGoals(),
                builder: (context, snapshot) {
                  late final List<Goal> goalList;
                  if (snapshot.hasError) {
                    goalList = [];
                    /*return Center(
                      
                        child: const Text(
                            'Something went wrong! Error: getGoals'));
                            */
                  }
                  if (snapshot.hasData) {
                    goalList = snapshot.data!;

                    return Scaffold(
                      floatingActionButton: RotationTransition(
                        //floating action button
                        turns: animation,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(45 / 360),
                          child: FloatingActionButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _currentIndex = 2;
                                _pageController.animateToPage(_currentIndex,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn);
                              });
                            },
                            tooltip: "Add Goal",
                            elevation: 4.0,
                            backgroundColor: Colors.black,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-45 / 360),
                              child:
                                  const Icon(Icons.add_circle_outline_rounded),
                            ),
                          ),
                        ),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                      extendBody: true,
                      body: PageView(
                        controller: _pageController,
                        onPageChanged: ((newIndex) {
                          setState(() {
                            _currentIndex = newIndex;
                          });
                        }),
                        children: [
                          home(curUser: curUser, goalList: goalList),
                          chat(curUser: curUser),
                          addGoal(curUser: curUser),
                          trendingGoals(curUser: curUser),
                          profile(curUser: curUser, goalList: goalList,),
                        ],
                      ),
                      bottomNavigationBar: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 130, 112, 230),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 8)),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(200)),
                            child: BottomNavigationBar(
                              backgroundColor: Colors.white,
                              items: _bottomNavBarItems,
                              showUnselectedLabels: false,
                              fixedColor: Color.fromARGB(255, 130, 112, 230),
                              selectedIconTheme: IconThemeData(
                                  color: Color.fromARGB(255, 130, 112, 230)),
                              type: BottomNavigationBarType.fixed,
                              currentIndex: _currentIndex,
                              onTap: (index) {
                                setState(() {
                                  _pageController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 250),
                                      curve: Curves.easeIn);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
