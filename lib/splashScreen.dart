import 'dart:async';
import 'package:final_project_tourism/LoginSignups/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();
  Timer(
    const Duration(seconds: 3),
    () => Navigator.of(context).pushReplacement(
      PageTransition(
        reverseDuration: Duration(seconds: 2),
        type: PageTransitionType.leftToRightWithFade,
        child: const WelcomeScreen(),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/abcd.jpg',),
      ),
    );
  }
}
