import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onBackTap;

  final bool showBackButton;
  final bool showSearchButton;
  final bool showNotificationButton;

  const PrimaryAppBar({
    Key? key,
    required this.title,
    this.onSearchTap,
    this.onNotificationTap,
    this.onBackTap,
    this.showBackButton = true,
    this.showSearchButton = true,
    this.showNotificationButton = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          if (showBackButton)
            _buildActionIcon(
              icon: Icons.arrow_back,
              onTap: onBackTap ?? () => Navigator.of(context).pop(),
            )
          else
            const SizedBox(width: 30),

          Text(
            title,
            style: AppTextTheme.h4(
              weight: FontWeight.w600,
            ).copyWith(fontSize: 18),
          ),

          Row(
            children: [
              if (showSearchButton)
                _buildActionIcon(icon: Icons.search, onTap: onSearchTap),
              if (showSearchButton && showNotificationButton) 8.widthBox,
              if (showNotificationButton)
                _buildActionIcon(
                  icon: Icons.notifications_outlined,
                  onTap: onNotificationTap,
                ),
            ],
          ),
        ],
      ).px4(),
    );
  }

  Widget _buildActionIcon({required IconData icon, VoidCallback? onTap}) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
