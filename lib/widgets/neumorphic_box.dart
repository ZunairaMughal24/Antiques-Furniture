import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NeumorphicBox extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double depth;

  const NeumorphicBox({
    super.key,
    required this.child,
    this.borderRadius = 15,
    this.padding,
    this.margin,
    this.color,
    this.depth = 8,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? AppColors.neumorphicBase;

    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [baseColor.withOpacity(0.1), baseColor],
        ),
        boxShadow: [
          //Light Shadow
          BoxShadow(
            color: AppColors.neumorphicLight.withOpacity(1.0),
            offset: Offset(-depth / 2, -depth / 2),
            blurRadius: depth,
            spreadRadius: 1,
          ),
          //Dark Shadow
          BoxShadow(
            color: AppColors.neumorphicDark.withOpacity(0.6),
            offset: Offset(depth / 2, depth / 2),
            blurRadius: depth,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
    );
  }
}
