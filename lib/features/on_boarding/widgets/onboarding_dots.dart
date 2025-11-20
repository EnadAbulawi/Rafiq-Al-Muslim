import 'package:flutter/material.dart';
import 'package:rafiq_muslim/data/models/onboarding_model.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        onboardingItems.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: currentIndex == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: currentIndex == index
                ? onboardingItems[currentIndex].color
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
