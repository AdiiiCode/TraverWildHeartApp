import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          Text.rich( TextSpan(text: 'Hello ',
          children: [
            TextSpan(
              text: email,
          style: const TextStyle(
            fontSize: 18.0
          ),
            ),
          ]
          ),),

        ],
      ),
    );
  }
}