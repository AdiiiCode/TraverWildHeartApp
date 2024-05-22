import 'package:flutter/material.dart';

TextField reusableField(String text, IconData icon, bool isPass, String hint, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPass,
    autocorrect: !isPass,
    decoration: InputDecoration(
      hintText: 'Enter your $hint here', // Use the provided hint text
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    ),
  );
}
