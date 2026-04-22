import 'package:antiques_furniture/features/onboarding/data/datasources/onboarding_datasource.dart';
import 'package:antiques_furniture/features/onboarding/domain/entities/onboarding_slide_entity.dart';
import 'package:antiques_furniture/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource dataSource;

  OnboardingRepositoryImpl(this.dataSource);

  @override
  List<OnboardingSlideEntity> getOnboardingSlides() {
    return dataSource.getOnboardingSlides();
  }
}
