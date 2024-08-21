import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;
  final bool isBold;

  const RegularText({
    super.key,
    required this.text,
    this.size = 14,
    this.color = const Color(0xFF313131),
    this.height = 1.4,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}
