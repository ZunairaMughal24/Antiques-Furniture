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

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(AppRoutes.signUpScreenRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.primaryColor,
              width: dimensions.width * 0.3 - dimensions.height * 0.03,
              child: Image.asset(AppImages.splash1, color: AppColors.white),
            ),
            8.heightBox,
            Column(
              children: [
                Text(
                  'Antiques',
                  style: AppTextTheme.logoStyle(
                    fontSize: 20,
                    weight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Furniture',
                  style: AppTextTheme.logoStyle(
                    fontSize: 13,
                    weight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).safeArea();
  }
}
