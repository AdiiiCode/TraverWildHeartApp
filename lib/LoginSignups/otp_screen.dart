// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  EmailOTP myauth = EmailOTP();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Generate OTP function
  String generateOTP() {
    final Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  // Send OTP via Email
  Future<void> _sendOTP() async {
    String email = _emailController.text.trim();
    try {
      // Check if the email exists in Firestore
      var querySnapshot = await _firestore.collection('users').where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        myauth.setConfig(
          appEmail: 'buniversity4@gmail.com',
          appName: 'WildHeart Adventures',
          userEmail: email,
          otpLength: 4,
          otpType: OTPType.digitsOnly
        );
        bool result = await myauth.sendOTP();
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('OTP sent to $email'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to send OTP. Please try again later.'),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email does not exist'),
          ),
        );
      }
    } catch (error) {
      // print('Error sending OTP: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending OTP: $error'),
        ),
      );
    }
  }

  Future<void> _verifyOTP() async {
    bool result = await myauth.verifyOTP(otp: _otpController.text);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Success OTP Verified'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Valid OTP'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to WildHeart Adventures',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const Text(
                'Travel and Explore with us',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email Address',
                    prefixIcon: const Icon(Icons.mail),
                    suffixIcon: GestureDetector(
                      onTap: _sendOTP,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your 4 Digits OTP',
                    prefixIcon: const Icon(Icons.output),
                    suffixIcon: GestureDetector(
                      onTap: _verifyOTP,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Verify OTP',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
