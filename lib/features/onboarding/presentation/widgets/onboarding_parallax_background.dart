import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';
import 'package:flutter/material.dart';

class OnboardingParallaxBackground extends StatelessWidget {
  final List<OnboardingSlideEntity> slides;
  final double scrollOffset;
  final Size screenSize;

  const OnboardingParallaxBackground({
    super.key,
    required this.slides,
    required this.scrollOffset,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: slides.asMap().entries.map((entry) {
            int index = entry.key;
            String image = entry.value.image;

            return Positioned.fill(
              left: (index * screenSize.width) - scrollOffset * 0.5,
              child: Image.asset(image, fit: BoxFit.cover),
            );
          }).toList(),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.35),
                  Colors.transparent,
                  Colors.black.withOpacity(0.55),
                  Colors.black,
                ],
                stops: const [0.0, 0.45, 0.75, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
