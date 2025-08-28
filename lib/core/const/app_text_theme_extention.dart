
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:flutter/material.dart';


extension TextThemeExtension on Text {
  Text h1({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.h1(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
   
  );

  Text h2({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.h2(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text h3({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.h3(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text h4({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.h4(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text bodyLarge({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.bodyLarge(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text bodyMedium({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.bodyMedium(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text bodySmall({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.bodySmall(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text labelLarge({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.labelLarge(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text labelMedium({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.labelMedium(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  Text labelSmall({Color? color, FontWeight? weight}) => Text(
    data!,
    style: AppTextTheme.labelSmall(color: color, weight: weight!),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );
}
