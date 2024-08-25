import 'package:coffee_shop_app/pages/coffee_detail_page.dart';
// import 'package:coffee_shop_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'theme/theme_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffe Shop App',
      theme: themeSettings,
      home: const CoffeeDetailPage(),
      // home: const HomePage(),
    );
  }
}
