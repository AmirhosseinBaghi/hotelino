import 'package:flutter/material.dart';
import 'package:hotelino/feachures/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/feachures/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:hotelino/feachures/onboarding/presentation/widgets/onboarding_items.dart';
import 'package:hotelino/routes/app_route.dart';
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingButton(
                    visible: onboardingprovider.currentPage > 0,
                    icon: Icons.arrow_back,
                    backgroundcolor: Colors.transparent,
                    iconColor: Theme.of(context).colorScheme.primary,
                    onPeressed: () {
                      if (onboardingprovider.currentPage > 0) {
                        _pageControler.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    }),
                OnboardingButton(
                    visible: onboardingprovider.currentPage < totalPage - 1,
                    icon: Icons.arrow_forward,
                    backgroundcolor: Theme.of(context).colorScheme.primary,
                    iconColor: Colors.white,
                    onPeressed: () {
                      if (onboardingprovider.currentPage < totalPage - 1) {
                        _pageControler.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    })
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          if (totalPage > 1) ...[
            AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                      sizeFactor: animation, axisAlignment: -1, child: child);
                },
                child: onboardingprovider.currentPage == totalPage - 1
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoute.home);
                              },
                              child: Text("شروع رزرو هتل ها")),
                        ),
                      )
                    : null)
          ]
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
