import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? borderColor;
  final double? borderWidth;

  const AppContainer({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.padding,
    this.margin,
    this.color,
    this.boxShadow,
    this.border,
    this.borderColor,
    this.borderWidth,

    double? depth,
    dynamic style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color ?? AppColors.neumorphicBase,
        borderRadius: BorderRadius.circular(borderRadius),
        border:
            border ??
            (borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth ?? 1.0)
                : null),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),

              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 1,
                offset: const Offset(0, -1),
              ),
            ],
      ),
      child: child,
    );
  }
}
