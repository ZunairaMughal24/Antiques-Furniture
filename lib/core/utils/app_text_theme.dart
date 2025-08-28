import 'package:flutter/material.dart';

class AppTextTheme {
  // Heading Styles
  static TextStyle h1({
    Color? color,
    FontWeight weight = FontWeight.w700,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 32,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle h2({
    Color? color,
    FontWeight weight = FontWeight.w700,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 28,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle h3({
    Color? color,
    FontWeight weight = FontWeight.w600,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 24,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle h4({
    Color? color,
    FontWeight weight = FontWeight.w600,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 20,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  // Body Text Styles
  static TextStyle bodyLarge({
    Color? color,
    FontWeight weight = FontWeight.w400,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 18,
    height: lineHeight ?? 1.5,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle bodyMedium({
    Color? color,
    FontWeight weight = FontWeight.w400,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 16,
    height: lineHeight ?? 1.5,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle bodySmall({
    Color? color,
    FontWeight weight = FontWeight.w400,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 14,
    height: lineHeight ?? 1.5,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  // Label Styles
  static TextStyle labelLarge({
    Color? color,
    FontWeight weight = FontWeight.w500,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 16,
    height: lineHeight ?? 1.2,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle labelMedium({
    Color? color,
    FontWeight weight = FontWeight.w500,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 14,
    height: lineHeight ?? 1.2,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle labelSmall({
    Color? color,
    FontWeight weight = FontWeight.w500,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 12,
    height: lineHeight ?? 1.2,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  // Button Text Styles
  static TextStyle buttonLarge({
    Color? color,
    FontWeight weight = FontWeight.w600,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 18,
    height: lineHeight ?? 1.2,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle buttonMedium({
    Color? color,
    FontWeight weight = FontWeight.w600,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 16,
    height: lineHeight ?? 1.2,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle buttonSmall({
    Color? color,
    FontWeight weight = FontWeight.w600,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 14,
    height: lineHeight ?? 1.2,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  // Caption Styles
  static TextStyle caption({
    Color? color,
    FontWeight weight = FontWeight.w400,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 12,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  // Link Styles
  static TextStyle link({
    Color? color,
    FontWeight weight = FontWeight.w500,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 16,
    height: lineHeight ?? 1.5,
    fontWeight: weight,
    decoration: TextDecoration.underline,
    color: color,
    fontFamily: fontFamily,
  );

  // Custom Styles for specific use cases
  static TextStyle title({
    Color? color,
    FontWeight weight = FontWeight.w700,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 22,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );

  static TextStyle subtitle({
    Color? color,
    FontWeight weight = FontWeight.w500,
    String? fontFamily,
    double? lineHeight,
  }) => TextStyle(
    fontSize: 18,
    height: lineHeight ?? 1.3,
    fontWeight: weight,
    color: color,
    fontFamily: fontFamily,
  );
}
