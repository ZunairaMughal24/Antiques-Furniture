import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const IconButton({
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset(
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
