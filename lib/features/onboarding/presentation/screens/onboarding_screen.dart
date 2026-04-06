import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  final List<_OnboardingSlide> _slides = const [
    _OnboardingSlide(
      tag: "PREMIUM COLLECTION",
      title: "Discover\nTimeless Elegance",
      description:
          "Bring timeless elegance into your home. Explore our curated selection of premium antique furniture.",
      icon: Icons.auto_awesome,
      image: "assets/images/auth_bg_antique.jpg",
    ),
    _OnboardingSlide(
      tag: "HANDCRAFTED QUALITY",
      title: "Artisan\nCraftsmanship",
      description:
          "Every piece tells a story. Meticulously restored and handcrafted furniture from master artisans around the world.",
      icon: Icons.handyman,
      image: "assets/images/auth_bg_furniture.jpg",
    ),
    _OnboardingSlide(
      tag: "EXCLUSIVE DEALS",
      title: "Your Dream\nHome Awaits",
      description:
          "Transform your living spaces with authentic vintage pieces. Enjoy exclusive deals on rare collectibles.",
      icon: Icons.home_rounded,
      image: "assets/images/auth_bg_wood_antique.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

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

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Parallax Layer
          Stack(
            children: _slides.asMap().entries.map((entry) {
              int index = entry.key;
              String image = entry.value.image;

              return Positioned.fill(
                left: (index * size.width) - _scrollOffset * 0.5,
                child: Image.asset(image, fit: BoxFit.cover),
              );
            }).toList(),
          ),

          // Deep Gradient Overlay for readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Content Layer
          SafeArea(
            child: Column(
              children: [
                // Top bar with logo and skip
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.3),
                          ),
                        ),
                        child: Icon(
                          Icons.weekend_rounded,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Furniture",
                            style: AppTextTheme.logoStyle(
                              color: AppColors.primaryColor,
                              fontSize: 11,
                              weight: FontWeight.w600,
                            ).copyWith(letterSpacing: 1),
                          ),
                        ],
                      ),
                      const Spacer(),
                      //Skip button
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutes.loginScreenRoute);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                        child: Text(
                          "Skip",
                          style: AppTextTheme.bodySmall(
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Slide content area with horizontal translation
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _slides.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _fadeController,
                        builder: (context, _) {
                          double slideProgress =
                              (_scrollOffset / size.width) - index;
                          double opacity = (1.0 - slideProgress.abs()).clamp(
                            0.0,
                            1.0,
                          );
                          double horizontalOffset = slideProgress * 100;

                          return Opacity(
                            opacity: opacity * _fadeController.value,
                            child: Transform.translate(
                              offset: Offset(horizontalOffset, 0),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Branding Tag
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppColors.primaryColor
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                        child: Text(
                                          _slides[index].tag,
                                          style: AppTextTheme.caption(
                                            color: AppColors.primaryColor,
                                            weight: FontWeight.w700,
                                          ).copyWith(letterSpacing: 1.5),
                                        ),
                                      ),
                                      12.heightBox,

                                      // Title
                                      Text(
                                        _slides[index].title,
                                        style: AppTextTheme.logoStyle(
                                          color: Colors.white,
                                          fontSize: 34,
                                          weight: FontWeight.w700,
                                        ).copyWith(height: 1.1),
                                      ),
                                      8.heightBox,

                                      // Description
                                      Text(
                                        _slides[index].description,
                                        style: AppTextTheme.bodyMedium(
                                          color: Colors.white.withOpacity(0.85),
                                        ).copyWith(height: 1.6),
                                      ),
                                      20.heightBox,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                //Footer section: Indicators and Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      //Indicators
                      Row(
                        children: List.generate(
                          _slides.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutCubic,
                            margin: const EdgeInsets.only(right: 8),
                            height: 4,
                            width: _currentPage == index ? 40 : 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _currentPage == index
                                  ? AppColors.primaryColor
                                  : Colors.white.withOpacity(0.3),
                              boxShadow: _currentPage == index
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.4),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      //CTA Buttons
                      PrimaryButton(
                        text: _currentPage == _slides.length - 1
                            ? 'Get Started'
                            : 'Next',
                        onTap: () {
                          if (_currentPage < _slides.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutCubic,
                            );
                          } else {
                            context.push(AppRoutes.loginScreenRoute);
                          }
                        },
                        suffixIcon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      14.heightBox,
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutes.signUpScreenRoute);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1.5,
                            ),
                          ),
                          minimumSize: const Size(double.infinity, 56),
                        ),
                        child: Text(
                          'Create an Account',
                          style: AppTextTheme.bodyMedium(
                            color: AppColors.primaryColor,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Data model for onboarding slide
class _OnboardingSlide {
  final String tag;
  final String title;
  final String description;
  final IconData icon;
  final String image;

  const _OnboardingSlide({
    required this.tag,
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });
}
