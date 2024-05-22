// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tourism/HomePage/open_page.dart';
import 'package:final_project_tourism/LoginSignups/signup_page.dart';
import 'package:final_project_tourism/LoginSignups/otp_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  bool _isLoading = false; 

  Future<void> _loginWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // UserCredential userCredential =
      //     await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // );
      DocumentSnapshot userDoc = (await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: _emailController.text).get()).docs.first;
      // print("User Doc: ${userDoc.data()}");
      if (userDoc.exists) {
        String username = userDoc['username'];

        await Future.delayed(const Duration(seconds: 3)); // Simulate loading for 3 seconds

        // Login successful, navigate to next page with username
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OpenPage(username),
          ),
        );
      } else {
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("User not found in Firestore"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
            ],
          );
        },
      );
        throw Exception("User not found in Firestore");
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2)); // Simulate loading for 3 seconds

      // Login failed, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Invalid email or password"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Welcome.png',
                  width: 250,
                ),
                const Text(
                  'Welcome to Adeel Travelers',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your email here',
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
    controller: _passwordController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }
      return null;
    },
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: 'Enter your password here',
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    ),
  ),
),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen()));
                  },
                  child: const Text('Forget Password'),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const BeveledRectangleBorder(),
                      side: const BorderSide(color: Colors.black, width: 0.2),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginWithEmailAndPassword();
                      }
                    },
                    child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an Account? New Here '),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.lightBlue.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
