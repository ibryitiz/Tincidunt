import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const GetStartedButton({
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
                color: Colors.black.withOpacity(0.3), // Gölge rengi
                spreadRadius: 0.5, // Gölgenin yayılma miktarı
                blurRadius: 8, // Gölgenin bulanıklık miktarı
                offset: const Offset(0, 5), // Gölgenin x ve y eksenindeki konumu
              ),
            ],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 5,
              ),
            ),
          )),
    );
  }
}
