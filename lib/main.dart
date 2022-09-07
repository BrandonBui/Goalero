import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goalero/main_page.dart';

import "./login_page.dart";
import "./signup_page.dart";
// import "./logo_loading.dart";
import "./landing_page.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      initialRoute: "/landingPage",
      routes: {
        "/landingPage": (context) => const LandingPage(),
        "/loginPage": (context) => LoginPage(),
        "/signupPage": (context) => SignupPage(),
      },
    );
  }
}
