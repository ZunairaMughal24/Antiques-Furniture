import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextTheme.editorialStyle(
            weight: FontWeight.w700,
            letterSpacing: 1.0,
          ).copyWith(fontSize: 20, color: Colors.black87),
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: AppTextTheme.bodySmall(
                color: AppColors.accentGold,
                weight: FontWeight.w500,
              ).copyWith(fontSize: 14),
            ),
          ),
      ],
    );
  }
}
