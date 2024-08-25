import 'package:coffee_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SuperiorityTag extends StatelessWidget {
  final String iconPath;

  const SuperiorityTag({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kBeigeLightColor,
        borderRadius: BorderRadius.circular(kRadius12),
      ),
      child: Image.asset(iconPath),
    );
  }
}
