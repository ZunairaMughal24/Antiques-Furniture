import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIconButton extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryIconButton({
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSvg = imagePath.toLowerCase().endsWith('.svg');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isSvg
            ? SvgPicture.asset(
                imagePath,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.lightGrey,
                  BlendMode.srcIn,
                ),
              )
            : Image.asset(
                imagePath,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
                color: isSelected ? AppColors.white : AppColors.lightGrey,
              ),
      ),
    );
  }
}
