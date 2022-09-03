import 'package:flutter/material.dart';

import "./login_page.dart";
import "./signup_page.dart";
// import "./logo_loading.dart";
import "./landing_page.dart";

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/landingPage",
      routes: {
        "/landingPage": (context) => const LandingPage(),
        "/loginPage": (context) => LoginPage(),
        "/signupPage": (context) => SignupPage(),
      },
      
    );
  }
}