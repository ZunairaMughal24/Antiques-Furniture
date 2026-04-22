import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';
import 'package:antiques_furniture/features/onboarding/domain/usecases/get_onboarding_slides_usecase.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final GetOnboardingSlidesUseCase getOnboardingSlidesUseCase;

  OnboardingProvider({required this.getOnboardingSlidesUseCase});

  List<OnboardingSlideEntity> _slides = [];
  List<OnboardingSlideEntity> get slides => List.unmodifiable(_slides);

  void loadSlides() {
    _slides = getOnboardingSlidesUseCase();
    notifyListeners();
  }
}
