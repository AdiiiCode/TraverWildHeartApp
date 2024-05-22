import 'package:flutter/material.dart';

class Descripts extends StatefulWidget {
  final String name;

  const Descripts(this.name,{super.key});

  @override
  State<Descripts> createState() => _DescriptsState();
}

class _DescriptsState extends State<Descripts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300
        ),
        child: const Column(
          children: [
            Expanded(
              child: Center(
                child: Text('data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
