import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicators extends StatelessWidget {
  final int total;
  final int current;

  const OnboardingIndicators({
    super.key,
    required this.total,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuint,
          margin: const EdgeInsets.only(right: 12),
          height: 5,
          width: current == index ? 32 : 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: current == index
                ? AppColors.primaryColor
                : Colors.white.withOpacity(0.2),
            boxShadow: current == index
                ? [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
        ),
      ),
    );
  }
}
