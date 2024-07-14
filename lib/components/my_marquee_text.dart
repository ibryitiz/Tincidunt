import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';

class MyMarqueeText extends StatelessWidget {
  final String text;
  const MyMarqueeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MarqueeText(
      text: TextSpan(text: text),
      style: const TextStyle(
        fontSize: 36,
        color: Colors.white,
        letterSpacing: 5,
      ),
      speed: 45,
    );
  }
}
