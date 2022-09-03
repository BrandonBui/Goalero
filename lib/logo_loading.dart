import 'package:flutter/material.dart';

class LogoLoading extends StatelessWidget {
  const LogoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
            
            height: 250,
              //color: Colors.green,
              //padding: EdgeInsets.all(100),
              child: Image.asset("images/Goalero Logo No BG.png")
        ),
      ),
    );
  }
}