import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';
import 'package:flutter/material.dart';

class OnboardingContentTransition extends StatelessWidget {
  final OnboardingSlideEntity slide;
  final int index;
  final double scrollOffset;
  final double screenWidth;
  final Animation<double> fadeAnimation;

  const OnboardingContentTransition({
    super.key,
    required this.slide,
    required this.index,
    required this.scrollOffset,
    required this.screenWidth,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    double slideProgress = (scrollOffset / screenWidth) - index;
    double opacity = (1.0 - slideProgress.abs()).clamp(0.0, 1.0);
    double horizontalOffset = slideProgress * 100;

    return Opacity(
      opacity: opacity * fadeAnimation.value,
      child: Transform.translate(
        offset: Offset(horizontalOffset, 0),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBrandingLabel(),
                  16.heightBox,

                  Text(
                    slide.title,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.logoStyle(
                      color: Colors.white,
                      fontSize: 32,
                      weight: FontWeight.w700,
                    ).copyWith(height: 1.15, letterSpacing: 0.5),
                  ),
                  16.heightBox,

                  Text(
                    slide.description,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.bodyMedium(
                      color: Colors.white.withOpacity(0.7),
                    ).copyWith(height: 1.8, letterSpacing: 0.5),
                  ),
                  40.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandingLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 1,
          color: AppColors.primaryColor.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            slide.tag,
            style: AppTextTheme.caption(
              color: AppColors.primaryColor,
              weight: FontWeight.w600,
            ).copyWith(letterSpacing: 2),
          ),
        ),
        Container(
          width: 24,
          height: 1,
          color: AppColors.primaryColor.withOpacity(0.5),
        ),
      ],
    );
  }
}
