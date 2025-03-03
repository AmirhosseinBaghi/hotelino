import 'package:flutter/material.dart';

class OnboardingItems extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const OnboardingItems(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 290,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
