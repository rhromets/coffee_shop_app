import 'package:flutter/material.dart';
import 'package:coffee_shop_app/constants/colors.dart';

final ThemeData themeSettings = ThemeData(
  scaffoldBackgroundColor: kWhiteLightColor,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: kDarkColor,
    secondary: kGreyColor,
    onSecondary: kDarkColor,
    error: kRedLightColor,
    onError: kDarkColor,
    surface: kBrownColor,
    onSurface: kDarkColor,
  ),
);
