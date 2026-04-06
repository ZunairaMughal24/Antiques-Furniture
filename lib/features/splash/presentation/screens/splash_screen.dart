import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/const/dimentions.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppRoutes.onboardingScreenRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: AppColors.white),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  width: dimensions.width * 0.28,
                  height: dimensions.width * 0.28,
                  child: Center(
                    child: Image.asset(
                      AppImages.splash1,
                      color: AppColors.white,
                    ),
                  ),
                ),
                20.heightBox,
                Text(
                  'ANTIQUES',
                  style: AppTextTheme.logoStyle(
                    fontSize: 30,
                    weight: FontWeight.bold,
                    letterSpacing: 4,
                    color: AppColors.blackColor,
                  ),
                ),
                4.heightBox,
                Text(
                  'FURNITURE',
                  style: AppTextTheme.logoStyle(
                    fontSize: 14,
                    weight: FontWeight.w500,
                    letterSpacing: 6,
                    color: AppColors.primaryColor,
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
