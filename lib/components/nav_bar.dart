import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey[300],
        tabActiveBorder: Border.all(color: Colors.white, width: 2),
        tabs: [
          //shop
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),

          //cart
          GButton(
            icon: Icons.favorite_rounded,
            text: 'Fav',
          ),
        ],
      ),
    );
  }
}
