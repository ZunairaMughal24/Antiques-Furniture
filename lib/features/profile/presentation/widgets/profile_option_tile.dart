import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (iconColor ?? AppColors.primaryColor).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor ?? AppColors.primaryColor, size: 22),
          ),
          title: Text(
            title,
            style: AppTextTheme.labelLarge(
              weight: FontWeight.w600,
              color: iconColor != null ? AppColors.errorRed : AppColors.pureBlack,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.lightGrey),
          contentPadding: EdgeInsets.zero,
        ),
        const Divider(color: Color(0xFFEEEEEE), height: 1),
      ],
    ).py4();
  }
}
