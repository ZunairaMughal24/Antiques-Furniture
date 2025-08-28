
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


extension BuildContextExtended on BuildContext {
  Color get adaptive05 => Theme.of(this).dividerColor.withValues(alpha: 0.05);
  Color get adaptive07 => Theme.of(this).dividerColor.withValues(alpha: 0.07);
  Color get adaptive12 => Theme.of(this).dividerColor.withValues(alpha: 0.12);
  Color get adaptive26 => Theme.of(this).dividerColor.withValues(alpha: 0.26);
  Color get adaptive38 => Theme.of(this).dividerColor.withValues(alpha: 0.38);
  Color get adaptive45 => Theme.of(this).dividerColor.withValues(alpha: 0.45);
  Color get adaptive54 => Theme.of(this).dividerColor.withValues(alpha: 0.54);
  Color get adaptive60 => Theme.of(this).dividerColor.withValues(alpha: 0.60);
  Color get adaptive70 => Theme.of(this).dividerColor.withValues(alpha: 0.70);
  Color get adaptive75 => Theme.of(this).dividerColor.withValues(alpha: 0.75);
  Color get adaptive87 => Theme.of(this).dividerColor.withValues(alpha: 0.87);
  Color get adaptive => Theme.of(this).dividerColor;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  Color get cardColor => Theme.of(this).cardColor;
  Color get primaryColor => Theme.of(this).primaryColor;

  ThemeData get theme => Theme.of(this);
}

extension ExtendedStringExtension on String {
  String get spacedNewLine => split(' ').map((e) => '$e\n').toList().join();

  Color toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    return AppColors.primaryColor;
  }
}
