import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tourism/LoginSignups/Models/users.dart';
import 'package:final_project_tourism/LoginSignups/otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController __emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _db = FirebaseFirestore.instance;

  late String _otp;

  @override
  void initState() {
    super.initState();
    _otp = _generateOTP();
    _sendEmail();
  }

  String _generateOTP() {
    // Generate a random 6-digit OTP
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  Future<void> _sendEmail() async {
    final smtpServer = gmail('buniversity4@gmail.com', 'Adeel@123044');
    final message = Message()
      ..from = Address('your_email@gmail.com', 'Your Name')
      ..recipients.add(__emailController.text)
      ..subject = 'OTP for WildHerart Adventures'
      ..text = 'Your OTP is: $_otp';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print('Error: $e');
    }
  }


  createUser() async {
    final user = userModel(
      username: usernameController.text,
      email: __emailController.text,
      phonenumber: phonenumberController.text,
      password: passwordController.text,
    );

    await _db.collection("LoginSignups").add(user.toJson()).whenComplete(() => print('abcd'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to WildHerart Adventures',
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
                  controller: usernameController,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: __emailController,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: phonenumberController,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your PhoneNumber';
                      }
                      return null;
                    },
                  decoration: const InputDecoration(   
                    hintText: 'Enter Phonenumber',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                      if (value == null || value.length>8) {
                        return 'Password length must be greater the 8';
                      }
                      else if(value.isEmpty)
                      {
                        return 'Enter The Password ';
                      }
                      return null;
                    },
                  obscureText: true,
                  decoration: const InputDecoration(   
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you CP';
                      }
                      return null;
                    },
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.password_sharp),
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    border: OutlineInputBorder(
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
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    shape: const BeveledRectangleBorder(),
                    side: const BorderSide(color: Colors.black, width: 0.2),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                      // createUser();
                      _sendEmail();
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OtpScreen(email: __emailController.text);
                    }));
                      // }
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    __emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
