import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
      child: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        onTap: (index) {
          context.read<NavigationBloc>().add(
                NavigateToEvent(index: index),
              );
        },
      ),
    );
  }
}
