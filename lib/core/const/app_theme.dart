import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color get primaryLight => const Color.fromARGB(255, 216, 193, 149);

  static ThemeData get lightTheme {
    return ThemeData(
      canvasColor: Colors.white,
      primaryColor: primaryLight,
      dividerColor: Colors.grey,
      scaffoldBackgroundColor: AppColors.neumorphicBase,
      fontFamily: GoogleFonts.nunito().fontFamily ?? 'Nunito',
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryLight,
        brightness: Brightness.light,
        primary: primaryLight,
        secondary: primaryLight,
        surface: const Color(0XFFF5F5F5),
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.blackColor),
        bodyMedium: TextStyle(color: AppColors.blackColor),
        bodySmall: TextStyle(color: AppColors.blackColor),
      ),
    );
  }
}
