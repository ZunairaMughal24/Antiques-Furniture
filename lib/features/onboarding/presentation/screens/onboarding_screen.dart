import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';
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
      tag: "CURATED SELECTION",
      title: "Discover\nTimeless Heritage",
      description:
          "Experience the artistry of past eras. Our curated collection brings museum-quality antiques into your contemporary living space.",
      icon: Icons.vignette_rounded,
      image: AppImages.premium_sofa,
    ),
    _OnboardingSlide(
      tag: "ARTISAN QUALITY",
      title: "Illuminating\nMasterpieces",
      description:
          "Each piece carries a legacy of master craftsmanship. Discover unique lighting that defines the soul of a room.",
      icon: Icons.light_outlined,
      image: AppImages.elegant_lamp,
    ),
    _OnboardingSlide(
      tag: "BOUTIQUE LUXURY",
      title: "Defining Your\nUnique Sanctuary",
      description:
          "Furniture that does more than fill a space. Find the statement pieces that tell your personal story of elegance.",
      icon: Icons.auto_awesome_mosaic_outlined,
      image: AppImages.antique_cabinet,
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

          // Content Layer
          SafeArea(
            child: Column(
              children: [
                // Stable Professional Header (Anti-Overflow Layout)
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 20.0, 12.0, 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Boutique Branding
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.vignette_rounded,
                            color: AppColors.primaryColor,
                            size: 24,
                          ),
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
                      ),

                      // Discreet Skip Button
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutes.loginScreenRoute);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "SKIP",
                          style: AppTextTheme.bodySmall(
                            color: Colors.white.withOpacity(0.4),
                            weight: FontWeight.bold,
                          ).copyWith(letterSpacing: 1.2),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Slide content area with horizontal translation and centered text
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
                          double opacity =
                              (1.0 - slideProgress.abs()).clamp(0.0, 1.0);
                          double horizontalOffset = slideProgress * 100;

                          return Opacity(
                            opacity: opacity * _fadeController.value,
                            child: Transform.translate(
                              offset: Offset(horizontalOffset, 0),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Minimalist Branding Label
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 24,
                                              height: 1,
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.5),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Text(
                                                _slides[index].tag,
                                                style: AppTextTheme.caption(
                                                  color: AppColors.primaryColor,
                                                  weight: FontWeight.w600,
                                                ).copyWith(letterSpacing: 2),
                                              ),
                                            ),
                                            Container(
                                              width: 24,
                                              height: 1,
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.5),
                                            ),
                                          ],
                                        ),
                                        16.heightBox,

                                        // Title: Impact-Safe Editorial Serif
                                        Text(
                                          _slides[index].title,
                                          textAlign: TextAlign.center,
                                          style: AppTextTheme.logoStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            weight: FontWeight.w700,
                                          ).copyWith(
                                            height: 1.15,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        16.heightBox,

                                        // Description: Premium Sans-Serif
                                        Text(
                                          _slides[index].description,
                                          textAlign: TextAlign.center,
                                          style: AppTextTheme.bodyMedium(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ).copyWith(
                                            height: 1.8,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        // Extra space for footer balance
                                        40.heightBox,
                                      ],
                                    ),
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

                // Footer section: Refined Indicators and Premium Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      // Refined Gold Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _slides.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOutQuint,
                            margin: const EdgeInsets.only(right: 12),
                            height: 5,
                            width: _currentPage == index ? 32 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentPage == index
                                  ? AppColors.primaryColor
                                  : Colors.white.withOpacity(0.2),
                              boxShadow: _currentPage == index
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // CTA Buttons with clean padding
                      PrimaryButton(
                        text: _currentPage == _slides.length - 1
                            ? 'Get Started'
                            : 'Next',
                        onTap: () {
                          if (_currentPage < _slides.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeOutQuart,
                            );
                          } else {
                            context.push(AppRoutes.loginScreenRoute);
                          }
                        },
                        suffixIcon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      12.heightBox,
                      TextButton(
                        onPressed: () {
                          context.push(AppRoutes.signUpScreenRoute);
                        },
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
                      ),
                      const SizedBox(height: 30),
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
