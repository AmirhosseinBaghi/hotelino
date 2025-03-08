import 'package:flutter/material.dart';
import 'package:hotelino/feachures/onboarding/presentation/onboarding_page.dart';
import 'package:hotelino/routes/main_bottomnav.dart';

class AppRoute {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String bookingForm = '/booking-form';
  static const String hotelDetail = '/hotel-detail';
  static const String favorites = '/favorites';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const MainBottomNav()
  };
}
