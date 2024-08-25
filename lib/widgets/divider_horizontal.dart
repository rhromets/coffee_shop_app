import 'package:coffee_shop_app/constants/constants.dart';
import 'package:flutter/material.dart';

class DividerHorizontal extends StatelessWidget {
  final double verticalMargin;
  final double horizontalMargin;
  final Color color;

  const DividerHorizontal({
    super.key,
    this.verticalMargin = 0.0,
    this.horizontalMargin = 0.0,
    this.color = kGreyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      color: color,
    );
  }
}
