import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:antiques_furniture/features/onboarding/presentation/widgets/onboarding_parallax_background.dart';
import 'package:antiques_furniture/features/onboarding/presentation/widgets/onboarding_content_transition.dart';
import 'package:antiques_furniture/features/onboarding/presentation/widgets/onboarding_indicators.dart';
import 'package:antiques_furniture/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _scrollOffset = 0.0;

  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnboardingProvider>().loadSlides();
    });

    _pageController.addListener(() {
      setState(() {
        _scrollOffset = _pageController.offset;
      });
    });

    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
    _fadeController.reset();
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        final slides = provider.slides;
        if (slides.isEmpty) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              OnboardingParallaxBackground(
                slides: slides,
                scrollOffset: _scrollOffset,
                screenSize: size,
              ),

              SafeArea(
                child: Column(
                  children: [
                    _buildHeader(context),
                    const Spacer(),

                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: slides.length,
                        onPageChanged: _onPageChanged,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _fadeController,
                            builder: (context, _) {
                              return OnboardingContentTransition(
                                slide: slides[index],
                                index: index,
                                scrollOffset: _scrollOffset,
                                screenWidth: size.width,
                                fadeAnimation: _fadeController,
                              );
                            },
                          );
                        },
                      ),
                    ),

                    _buildFooter(context, slides.length),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28.0, 20.0, 12.0, 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildLogo(), _buildSkipButton(context)],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.vignette_rounded, color: AppColors.primaryColor, size: 24),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ANTIQUES",
              style: AppTextTheme.logoStyle(
                color: Colors.white,
                fontSize: 16,
                weight: FontWeight.bold,
              ).copyWith(letterSpacing: 2),
            ),
            Text(
              "FURNITURE",
              style: AppTextTheme.logoStyle(
                color: AppColors.primaryColor,
                fontSize: 9,
                weight: FontWeight.w600,
              ).copyWith(letterSpacing: 1.5),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(AppRoutes.homeScreenRoute),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        "SKIP",
        style: AppTextTheme.bodySmall(
          color: Colors.white.withOpacity(0.4),
          weight: FontWeight.bold,
        ).copyWith(letterSpacing: 1.2),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, int totalSlides) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        children: [
          OnboardingIndicators(total: totalSlides, current: _currentPage),
          const SizedBox(height: 32),
          _buildNextButton(context, totalSlides),
          12.heightBox,
          _buildCreateAccountButton(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, int totalSlides) {
    return PrimaryButton(
      text: _currentPage == totalSlides - 1 ? 'Get Started' : 'Next',
      onTap: () {
        if (_currentPage < totalSlides - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutQuart,
          );
        } else {
          context.push(AppRoutes.homeScreenRoute);
        }
      },
      suffixIcon: const Icon(
        Icons.arrow_forward_rounded,
        color: Colors.black,
        size: 18,
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(AppRoutes.signUpScreenRoute),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppColors.primaryColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: Text(
        'Create an Account',
        style: AppTextTheme.bodyMedium(
          color: Colors.white,
          weight: FontWeight.w600,
        ).copyWith(letterSpacing: 1),
      ),
    );
  }
}
