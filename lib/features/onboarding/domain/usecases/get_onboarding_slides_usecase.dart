import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';
import 'package:antiques_furniture/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetOnboardingSlidesUseCase {
  final OnboardingRepository repository;

  GetOnboardingSlidesUseCase(this.repository);

  List<OnboardingSlideEntity> call() {
    return repository.getOnboardingSlides();
  }
}
