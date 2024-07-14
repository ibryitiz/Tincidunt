import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3), // Gölge rengi
                spreadRadius: 0.5, // Gölgenin yayılma miktarı
                blurRadius: 8, // Gölgenin bulanıklık miktarı
                offset: const Offset(0, 5), // Gölgenin x ve y eksenindeki konumu
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.grey.shade900,
                letterSpacing: 5,
              ),
            ),
          )),
    );
  }
}
