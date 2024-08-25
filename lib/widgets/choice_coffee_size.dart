import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChoiceCoffeeSize extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ChoiceCoffeeSize({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius12),
        color: isSelected ? kBeigeLightColor : Colors.white,
        border: Border.all(
          color: isSelected ? kBrownColor : kGreyColor,
          width: 1,
        ),
      ),
      child: RegularText(
        text: text,
        color: isSelected ? kBrownColor : const Color(0xFF313131),
      ),
    );
  }
}
