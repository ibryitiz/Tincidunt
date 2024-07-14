import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  const MyTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.arrow_forward,
          ),
          hintText: text,
          hintStyle: const TextStyle(
            letterSpacing: 3,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
