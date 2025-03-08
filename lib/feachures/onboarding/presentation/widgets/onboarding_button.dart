import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final Color backgroundcolor;
  final Color iconColor;
  final VoidCallback onPeressed;

  const OnboardingButton(
      {super.key,
      required this.visible,
      required this.icon,
      required this.backgroundcolor,
      required this.iconColor,
      required this.onPeressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: visible
          ? Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary, width: 1)),
              child: FloatingActionButton(
                key: ValueKey(icon),
                onPressed: onPeressed,
                shape: CircleBorder(),
                backgroundColor: backgroundcolor,
                elevation: 0,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
