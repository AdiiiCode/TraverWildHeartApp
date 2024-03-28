import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const SizedBox(
              width: 400,
              child: TextField(
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
            const SizedBox(
              width: 400,
              child: TextField(
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
            const SizedBox(
              width: 400,
              child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.password),
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
            const SizedBox(
              width: 400,
              child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Confirm email',
                    prefixIcon: Icon(Icons.password_sharp),
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
    );
  }
}
