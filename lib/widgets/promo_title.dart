import 'package:flutter/material.dart';

class PromoTitle extends StatelessWidget {
  final String text;
  final double widthText;
  const PromoTitle({
    super.key,
    required this.text,
    required this.widthText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 0,
            child: Container(
              height: 27,
              width: widthText,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2C2C2C),
                    Color(0xFF181818),
                  ],
                ),
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
