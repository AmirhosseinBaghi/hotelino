import 'package:flutter/material.dart';
import 'package:hotelino/feachures/onboarding/data/repositories/onboarding_repositories.dart';

class OnboardingProvider extends ChangeNotifier {
  final OnboardingRepositories repositories;
  OnboardingProvider(this.repositories) {
    _loadData();
  }

  int currentPage = 0;
  List<Map<String, String>> onboardingData = [];

  void _loadData() {
    onboardingData = repositories.onboardingData;
    notifyListeners();
  }

  void updatePage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
