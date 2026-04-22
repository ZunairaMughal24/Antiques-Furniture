import 'package:flutter/material.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';

abstract class OnboardingDataSource {
  List<OnboardingSlideEntity> getOnboardingSlides();
}

class OnboardingDataSourceImpl implements OnboardingDataSource {
  @override
  List<OnboardingSlideEntity> getOnboardingSlides() {
    return const [
      OnboardingSlideEntity(
        tag: "CURATED SELECTION",
        title: "Discover\nTimeless Heritage",
        description:
            "Experience the artistry of past eras. Our curated collection brings museum-quality antiques into your contemporary living space.",
        icon: Icons.vignette_rounded,
        image: AppImages.premium_sofa,
      ),
      OnboardingSlideEntity(
        tag: "ARTISAN QUALITY",
        title: "Illuminating\nMasterpieces",
        description:
            "Each piece carries a legacy of master craftsmanship. Discover unique lighting that defines the soul of a room.",
        icon: Icons.light_outlined,
        image: AppImages.elegant_lamp,
      ),
      OnboardingSlideEntity(
        tag: "BOUTIQUE LUXURY",
        title: "Defining Your\nUnique Sanctuary",
        description:
            "Furniture that does more than fill a space. Find the statement pieces that tell your personal story of elegance.",
        icon: Icons.auto_awesome_mosaic_outlined,
        image: AppImages.antique_cabinet,
      ),
    ];
  }
}
