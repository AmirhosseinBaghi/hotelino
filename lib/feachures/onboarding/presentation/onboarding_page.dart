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
          )),
          SizedBox(
            height: 20,
          ),
          buildPageIndicator(
              onboardingprovider.currentPage, totalPage, context),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }

  Widget buildPageIndicator(
      int currentPage, int totalPage, BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPage,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: currentPage == index ? 12 : 8,
            height: currentPage == index ? 12 : 8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.3)),
          ),
        ));
  }
}
