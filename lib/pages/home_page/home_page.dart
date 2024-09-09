import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/pages/home_page/home_content.dart';
import 'package:coffee_shop_app/pages/nav_screens.dart';
import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation.state.dart';
import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'package:coffee_shop_app/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const HomeContent(),
    const NavScreen1(),
    const NavScreen2(),
    const NavScreen3(),
  ];

  BottomNavigationBarItem createBottomNavItem({
    required String assetName,
    required String activeAssetName,
    required bool isActive,
    required BuildContext context,
  }) {
    if (isActive) {
      assetName = activeAssetName;
    }
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            assetName,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 5,
            width: isActive ? 10 : 0,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius16),
              color: kBrownColor,
            ),
          ),
        ],
      ),
      label: '',
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationChangedState) {
            return pages[state.index];
          }
          return pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationChangedState) {
            currentIndex = state.index;
          }

          final List<BottomNavigationBarItem> bottomNavItems = [
            createBottomNavItem(
              assetName: 'assets/icons/home.svg',
              activeAssetName: 'assets/icons/home-filled.svg',
              context: context,
              isActive: currentIndex == 0,
            ),
            createBottomNavItem(
              assetName: 'assets/icons/heart.svg',
              activeAssetName: 'assets/icons/heart-filled.svg',
              context: context,
              isActive: currentIndex == 1,
            ),
            createBottomNavItem(
              assetName: 'assets/icons/bag.svg',
              activeAssetName: 'assets/icons/bag-filled.svg',
              context: context,
              isActive: currentIndex == 2,
            ),
            createBottomNavItem(
              assetName: 'assets/icons/notification.svg',
              activeAssetName: 'assets/icons/notification-filled.svg',
              context: context,
              isActive: currentIndex == 3,
            ),
          ];

          return SafeArea(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kRadius24),
                topRight: Radius.circular(kRadius24),
              ),
              child: SizedBox(
                height: 70,
                child: BottomNavBar(
                  items: bottomNavItems,
                  currentIndex: currentIndex,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
