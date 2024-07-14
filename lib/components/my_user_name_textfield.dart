import 'package:flutter/material.dart';

class MyUserTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const MyUserTextField({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          letterSpacing: 4,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        controller: controller,
        cursorColor: Colors.grey.shade900,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff7dfdd9),
          icon: const Icon(
            Icons.arrow_forward,
            color: Color(0xff7dfdd9),
          ),
          hintText: text,
          hintStyle: const TextStyle(
            letterSpacing: 3,
            color: Colors.black,
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
