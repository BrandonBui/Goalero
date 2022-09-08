import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goalero/dashboard.dart';
import 'package:goalero/Authentication%20Pages/main_page.dart';

import 'Authentication Pages/login_page.dart';
import 'Authentication Pages/signup_page.dart';
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
      initialRoute: "/landingPage",
      routes: {
        "/landingPage": (context) => const LandingPage(),
        "/dashboardPage": (context) => DashboardPage(),
        "/MainPage": (context) => MainPage(),
      },
    );
  }
}
