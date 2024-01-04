import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:podcast_player/constants/colors.dart';
import 'package:podcast_player/screens/home.screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: const HomeScreen(),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          height: 60,
          key: _bottomNavigationKey,
          backgroundColor: AppColors.primary,
          buttonBackgroundColor: AppColors.activeColor,
          color: AppColors.seconary,
          items: const [
            Icon(Icons.home_outlined),
            Icon(Icons.local_fire_department_outlined),
            Icon(Icons.explore_outlined),
            Icon(Icons.chat_outlined),
            Icon(Icons.person_outline)
          ],
          onTap: (value) {},
        ),
      ),
    );
  }
}
