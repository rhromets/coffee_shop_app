import 'package:flutter/material.dart';
import 'package:coffee_shop_app/constants/colors.dart';

final ThemeData themeSettings = ThemeData(
  scaffoldBackgroundColor: kWhiteLightColor,
  fontFamily: 'Sora',
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    enableFeedback: false,
  ),
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
);
