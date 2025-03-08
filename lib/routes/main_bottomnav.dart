import 'package:flutter/material.dart';
import 'package:hotelino/routes/test.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildWidget() {
    return [HomePage(), FavoritePage(), BookingPage(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: [],
      controller: _controller,
      onItemSelected: (value) {},
    );
  }
}
