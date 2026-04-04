import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  //Simple Texts (Global Default: Nunito)
  static TextStyle _nunito({
    Color? color,
    double fontSize = 16,
    FontWeight weight = FontWeight.w400,
    double? lineHeight,
  }) => GoogleFonts.nunito(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
    height: lineHeight ?? 1.5,
  );

  //Logo Fonts (Cinzel)
  static TextStyle logoStyle({
    Color? color,
    double fontSize = 24,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
    double? letterSpacing,
  }) => GoogleFonts.cinzel(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
    height: lineHeight ?? 1.3,
    letterSpacing: letterSpacing,
  );

  //Mono/Specialized Texts (Geologica)
  static TextStyle monoStyle({
    Color? color,
    double fontSize = 14,
    FontWeight weight = FontWeight.w400,
    double? lineHeight,
  }) => GoogleFonts.geologica(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
    height: lineHeight ?? 1.5,
  );

  static TextStyle h1({
    Color? color,
    FontWeight weight = FontWeight.w700,
    double? lineHeight,
  }) => _nunito(
    fontSize: 32,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );

  static TextStyle h2({
    Color? color,
    FontWeight weight = FontWeight.w700,
    double? lineHeight,
  }) => _nunito(
    fontSize: 28,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );

  static TextStyle h3({
    Color? color,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
  }) => _nunito(
    fontSize: 24,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );

  static TextStyle h4({
    Color? color,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
  }) => _nunito(
    fontSize: 20,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );

  static TextStyle bodyLarge({
    Color? color,
    FontWeight weight = FontWeight.w400,
    double? lineHeight,
  }) => _nunito(
    fontSize: 18,
    weight: weight,
    color: color,
    lineHeight: lineHeight,
  );

  static TextStyle bodyMedium({
    Color? color,
    FontWeight weight = FontWeight.w400,
    double? lineHeight,
  }) => _nunito(
    fontSize: 16,
    weight: weight,
    color: color,
    lineHeight: lineHeight,
  );

  static TextStyle bodySmall({
    Color? color,
    FontWeight weight = FontWeight.w400,
    double? lineHeight,
  }) => _nunito(
    fontSize: 14,
    weight: weight,
    color: color,
    lineHeight: lineHeight,
  );

  static TextStyle labelLarge({
    Color? color,
    FontWeight weight = FontWeight.w500,
    double? lineHeight,
  }) => _nunito(
    fontSize: 16,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.2,
  );

  static TextStyle labelMedium({
    Color? color,
    FontWeight weight = FontWeight.w500,
    double? lineHeight,
  }) => _nunito(
    fontSize: 14,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.2,
  );

  static TextStyle labelSmall({
    Color? color,
    FontWeight weight = FontWeight.w500,
    double? lineHeight,
  }) => _nunito(
    fontSize: 12,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.2,
  );

  static TextStyle buttonLarge({
    Color? color,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
  }) => _nunito(
    fontSize: 18,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.2,
  );

  static TextStyle buttonMedium({
    Color? color,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
  }) => _nunito(
    fontSize: 16,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.2,
  );

  static TextStyle buttonSmall({
    Color? color,
    FontWeight weight = FontWeight.w600,
    double? lineHeight,
  }) => _nunito(
    fontSize: 14,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.2,
  );

  static TextStyle caption({
    Color? color,
    FontWeight weight = FontWeight.w400,
    double? lineHeight,
  }) => _nunito(
    fontSize: 12,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );

  static TextStyle link({
    Color? color,
    FontWeight weight = FontWeight.w500,
    double? lineHeight,
  }) => _nunito(
    fontSize: 16,
    weight: weight,
    color: color,
    lineHeight: lineHeight,
  ).copyWith(decoration: TextDecoration.underline);

  static TextStyle title({
    Color? color,
    FontWeight weight = FontWeight.w700,
    double? lineHeight,
  }) => _nunito(
    fontSize: 22,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );

  static TextStyle subtitle({
    Color? color,
    FontWeight weight = FontWeight.w500,
    double? lineHeight,
  }) => _nunito(
    fontSize: 18,
    weight: weight,
    color: color,
    lineHeight: lineHeight ?? 1.3,
  );
}
