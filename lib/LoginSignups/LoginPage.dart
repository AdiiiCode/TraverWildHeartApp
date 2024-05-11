import 'package:final_project_tourism/HomePage/OpenPage.dart';
import 'package:final_project_tourism/LoginSignups/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project_tourism/HomePage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Login successful, navigate to next page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OpenPage(),
        ),
      );
    } catch (e) {
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password here',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle forget password
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
                    child: const Text('Login',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white
                    ),),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text(
                    'Don\'t have an Account? New Here ',
                     ),
                    
                       
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage())),
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.lightBlue.shade900,
                            ),
                          ),
                        ),
                  ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
