import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _emailController = TextEditingController();
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      //try to reset password
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text("Password reset link sent! Check your email."));
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F6F8),
        appBar: AppBar(
          backgroundColor: Color(0xFF3f826d),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Enter your email and we will send you a password reset link!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF3F6F8),
                    border: Border.all(
                      color: Color(0xFFD9E0E6),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: InputBorder.none,
                    hintText: "Reset Password",
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                passwordReset();
              },
              child: const Text("Reset Password"),
              color: Color.fromARGB(255, 76, 155, 130),
            ),
          ],
        ));
  }
}
