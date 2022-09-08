import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goalero/Authentication%20Pages/auth_page.dart';
import 'package:goalero/dashboard.dart';
import 'package:goalero/Authentication%20Pages/login_page.dart';
import 'package:goalero/logo_loading.dart';
import 'package:goalero/main.dart';
import 'package:goalero/temp_home.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
