
import 'package:flutter/material.dart';

import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/extentions.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:flutter/services.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.isLoading = false,
    this.isDisabled = false,
    this.isOutline = false,
    this.text,
    this.textStyle,
    required this.onTap,
    this.elevation = 2,
    this.verticalPadding = 18,
    this.horizontalPadding = 0,
    this.width,
    this.child,
    this.color,
    this.textColor,
    this.disabledColor = AppColors.primaryColor,
    this.loadingColor = Colors.white,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.borderRadius = 200,
    this.showArrow = false,
    this.borderColor,
    this.useGradient = true,
  });

  final bool isDisabled;
  final bool isLoading;
  final bool isOutline;
  final String? text;
  final TextStyle? textStyle;
  final GestureTapCallback onTap;
  final double elevation;
  final double? width;
  final double verticalPadding;
  final double horizontalPadding;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color loadingColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? fontFamily;
  final double borderRadius;
  final bool showArrow;
  final Color? borderColor;
  final bool useGradient;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled || isLoading,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: () {
            if (isOutline || isDisabled) return Colors.transparent;
            return color ?? AppColors.secondaryColor;
          }.call(),
          border: () {
            if (isDisabled && isOutline) {
              return Border.all(
                color: borderColor ?? context.adaptive38,
                width: 1,
              );
            }
            if (isOutline) {
              return Border.all(
                color: borderColor ?? color ?? context.primaryColor,
                width: 1,
              );
            }
            return null;
          }.call(),
        ),
        child: MaterialButton(
          splashColor: () {
            if (isOutline) {
              return (color ?? context.primaryColor).withValues(alpha: 0.1);
            }
            return null;
          }.call(),
          highlightColor: context.primaryColor,
          elevation: isOutline ? 0 : elevation,
          highlightElevation: isOutline ? 0 : elevation,
          hoverElevation: 0,
          disabledColor: disabledColor,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide.none,
          ),
          onPressed: isDisabled ? null : onTap,
          child: (() {
            if (isLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: horizontalPadding,
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
                  ),
                ),
              );
            }
            if (child != null) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: horizontalPadding,
                ),
                child: child!,
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text ?? '',
                    textAlign: TextAlign.center,
                    style:
                        textStyle ??
                        TextStyle(
                          fontFamily: fontFamily,
                          fontWeight: fontWeight ?? FontWeight.w600,
                          color: () {
                            if (textColor != null) return textColor;
                            if (isDisabled && isOutline) {
                              return context.adaptive38;
                            }
                            if (isDisabled) return context.adaptive75;
                            if (isOutline) return color ?? context.primaryColor;
                            return Colors.white;
                          }.call(),
                          fontSize: fontSize ?? 14,
                        ),
                  ),
                  if (showArrow) ...[
                    4.widthBox,
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ],
              ),
            );
          }).call(),
        ),
      ),
    );
  }
}
