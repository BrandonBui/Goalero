import 'package:flutter/material.dart';
import 'package:goalero/Authentication%20Pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goalero/Authentication%20Pages/login_page.dart';
import 'package:goalero/logo_loading.dart';
import 'package:goalero/Old/Unecessaary%20Pages/temp_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Goalero',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: height / 9),
                    child: Text('Welcome To',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 79, 78, 78),
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Goalero',
                        style: GoogleFonts.poppins(
                            fontSize: 40,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 5),
                Image.asset('images/target.gif'),
                Padding(
                    padding: EdgeInsets.all(height / 10),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint('I was tapped!');
                        Navigator.pushNamed(context, "/MainPage");
                      },
                      child: Container(
                        height: 65,
                        //style: EevatedButton.styleFrom(primary: const Color.fromARGB(255, 136, 95, 241), shadowColor: const Color.fromARGB(255, 120, 119, 119),elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color(0xff3f826d),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xff3f826d)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 136, 136, 136),
                                blurRadius: 5.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]),

                        child: Center(
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
