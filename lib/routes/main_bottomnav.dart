import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelino/core/constant/constant.dart';
import 'package:hotelino/feachures/home/homepage.dart';
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

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: Appcolors.primary,
          icon: SvgPicture.asset(
            "assets/images/nav_home.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_home.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: Appcolors.primary,
          icon: SvgPicture.asset(
            "assets/images/nav_favorite.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_favorite.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: Appcolors.primary,
          icon: SvgPicture.asset(
            "assets/images/nav_booking.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_booking.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: Appcolors.primary,
          icon: SvgPicture.asset(
            "assets/images/nav_profile.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/nav_profile.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      screens: _buildWidget(),
      items: _navBarItems(),
      controller: _controller,
      onItemSelected: (value) {},
      navBarStyle: NavBarStyle.style7,
      hideNavigationBarWhenKeyboardAppears: true,
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      animationSettings: NavBarAnimationSettings(
          navBarItemAnimation:
              ItemAnimationSettings(duration: Duration(milliseconds: 300))),
    );
  }
}
