import 'package:flutter/material.dart';
import 'package:hotelino/feachures/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/feachures/onboarding/presentation/widgets/onboarding_items.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageControler = PageController();
  @override
  Widget build(BuildContext context) {
    final onboardingprovider = Provider.of<OnboardingProvider>(context);
    final onboardingData = onboardingprovider.onboardingData;
    final int totalPage = onboardingData.length;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
            controller: _pageControler,
            itemCount: totalPage,
            onPageChanged: onboardingprovider.updatePage,
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return OnboardingItems(
                  title: data["title"]!,
                  description: data["description"]!,
                  image: data["image"]!);
            },
          ))
        ],
      ),
    );
  }
}
