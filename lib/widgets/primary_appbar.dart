import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/widgets/neumorphic_box.dart';
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
  Size get preferredSize => const Size.fromHeight(70); // Slightly taller for depth

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
            const SizedBox(width: 45),

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
              if (showNotificationButton)
                _buildActionIcon(
                  icon: Icons.notifications_outlined,
                  onTap: onNotificationTap,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon({required IconData icon, VoidCallback? onTap}) {
    return NeumorphicBox(
      borderRadius: 12,
      depth: 6,
      child: SizedBox(
        height: 45,
        width: 45,
        child: IconButton(
          icon: Icon(icon, color: Colors.black, size: 20),
          onPressed: onTap ?? () {},
        ),
      ),
    );
  }
}
