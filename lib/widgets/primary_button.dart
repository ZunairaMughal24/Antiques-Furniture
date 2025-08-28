import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final BorderSide? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDisabled;
  final Color? disabledColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.height = 44,
    this.width,
    this.backgroundColor = AppColors.buttonColor,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.fontSize,
    this.borderRadius = 10,
    this.boxShadow,
    this.padding,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.disabledColor = const Color(0xFFE0E0E0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isDisabled ? disabledColor : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: border == null ? null : Border.fromBorderSide(border!),
          boxShadow:
              boxShadow ??
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, const SizedBox(width: 8)],
            Text(
              text,
              style: AppTextTheme.buttonMedium(
                color: textColor ?? Colors.black,
                weight: FontWeight.w600,
              ).copyWith(fontSize: fontSize),
            ),
            if (suffixIcon != null) ...[const SizedBox(width: 8), suffixIcon!],
          ],
        ),
      ),
    );
  }
}
