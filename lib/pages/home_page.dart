import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/pages/coffee_list_page.dart';
import 'package:coffee_shop_app/pages/home_content.dart';
import 'package:coffee_shop_app/pages/nav_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const HomeContent(),
      const NavScreen1(),
      const NavScreen2(),
      const CoffeeListPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/home-filled.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
            kBrownColor,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/home.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        title: ("Home"),
        activeColorPrimary: kBrownColor,
        inactiveColorPrimary: kDarkSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/heart-filled.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/heart.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        title: ("Home"),
        activeColorPrimary: kBrownColor,
        inactiveColorPrimary: kDarkSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/bag-filled.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/bag.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        title: ("Home"),
        activeColorPrimary: kBrownColor,
        inactiveColorPrimary: kDarkSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/notification-filled.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/icons/notification.svg',
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        title: ("Home"),
        activeColorPrimary: kBrownColor,
        inactiveColorPrimary: kDarkSecondaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      backgroundColor: Colors.white,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 64,
      navBarStyle: NavBarStyle.style12,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius16),
          topRight: Radius.circular(kRadius16),
        ),
        colorBehindNavBar: kWhiteLightColor,
      ),
    );
  }
}
