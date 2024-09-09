import 'package:coffee_shop_app/pages/home_page/home_page.dart';
import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/theme_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavigationBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffe Shop App',
        theme: themeSettings,
        home: const HomePage(),
      ),
    );
  }
}
