import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tourism/LoginSignups/Models/users.dart';
import 'package:final_project_tourism/LoginSignups/otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _db = FirebaseFirestore.instance;

  createUser() async {
    final user = userModel(
      username: usernameController.text,
      email: emailController.text,
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
                  controller: emailController,
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
                    if (_formKey.currentState!.validate()) {
                      createUser();
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const OtpScreen();
                    }));
                      }
                    
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
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
