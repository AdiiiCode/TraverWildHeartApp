import 'package:final_project_tourism/HomePage/DetailsPage/details.dart';
import 'package:flutter/material.dart';

class Descrip extends StatefulWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final String identifier;
  final String name; // Add name parameter
  const Descrip(this.imagePath, this.text1, this.text2, this.identifier, this.name, {super.key}); // Update constructor

  @override
  State<Descrip> createState() => _DescripState();
}

class _DescripState extends State<Descrip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            width: 200,
            alignment: Alignment.center,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.text1,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsTrips(widget.identifier, widget.name))); // Pass name to DetailsTrips widget
          },
          child: Text(
            widget.text2,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
