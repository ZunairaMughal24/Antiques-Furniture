
import 'package:antiques_furniture/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class PrimaryCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? borderColor;
  final double borderRadius;
  final double? borderWidth;
  final BoxBorder? customBorder;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const PrimaryCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.borderWidth,
    this.customBorder,
    this.onTap,
    this.borderRadius = 14,
    this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin ?? const EdgeInsets.only(bottom: 16),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? context.cardColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border:
              customBorder ??
              Border.all(
                color: borderColor ?? context.adaptive12,
                width: borderWidth ?? 1.0,
              ),
        ),
        child: child,
      ),
    );
  }
}
