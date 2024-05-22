// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:final_project_tourism/LoginSignups/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => setState(() {
        _showImage = true;
      }),
    );
    Timer(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        PageTransition(
          reverseDuration: const Duration(seconds: 2),
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
        child: AnimatedOpacity(
          opacity: _showImage ? 1.0 : 0.0,
          duration: const Duration(seconds: 2),
          child: Transform.scale(
            scale: _showImage ? 1.0 : 0.5,
            child: Image.asset('assets/images/abcd.jpg'),
          ),
        ),
      ),
    );
  }
}
