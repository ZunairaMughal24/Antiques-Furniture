import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';

abstract class OnboardingRepository {
  List<OnboardingSlideEntity> getOnboardingSlides();
}
