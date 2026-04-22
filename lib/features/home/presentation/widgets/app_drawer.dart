import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    border: Border(
                      right: BorderSide(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: AppColors.accentGold,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: AppColors.white,
                            size: 35,
                          ),
                        ),
                      ),
                      20.heightBox,
                      Text(
                        "Zunaira Mughal",
                        style: AppTextTheme.editorialStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      4.heightBox,
                      Text(
                        "Member Since 2024",
                        style: AppTextTheme.bodySmall(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(color: Colors.white12, indent: 24, endIndent: 24),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      _DrawerTile(
                        icon: Icons.home_outlined,
                        title: "Home",
                        onTap: () => Navigator.pop(context),
                        isSelected: true,
                      ),
                      _DrawerTile(
                        icon: Icons.category_outlined,
                        title: "Categories",
                        onTap: () {
                          Navigator.pop(context);
                          context.push(AppRoutes.categoriesScreenRoute);
                        },
                      ),
                      _DrawerTile(
                        icon: Icons.shopping_bag_outlined,
                        title: "My Orders",
                        onTap: () {},
                      ),
                      _DrawerTile(
                        icon: Icons.favorite_border_rounded,
                        title: "Wishlist",
                        onTap: () {
                          Navigator.pop(context);
                          context.push(AppRoutes.wishlistRoute);
                        },
                      ),
                      _DrawerTile(
                        icon: Icons.location_on_outlined,
                        title: "Shipping Address",
                        onTap: () {},
                      ),
                      _DrawerTile(
                        icon: Icons.payment_outlined,
                        title: "Payment Methods",
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "PREFERENCES",
                          style: AppTextTheme.caption(
                            color: Colors.white30,
                            weight: FontWeight.bold,
                          ).copyWith(letterSpacing: 2),
                        ),
                      ),
                      _DrawerTile(
                        icon: Icons.settings_outlined,
                        title: "Settings",
                        onTap: () {},
                      ),
                      _DrawerTile(
                        icon: Icons.help_outline_rounded,
                        title: "Support",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                // Footer Section
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.accentGold.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.accentGold.withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.workspace_premium_rounded,
                              color: AppColors.accentGold,
                            ),
                            12.widthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Premium Club",
                                    style: AppTextTheme.bodySmall(
                                      color: AppColors.accentGold,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Exclusive access to vintage items",
                                    style: AppTextTheme.bodySmall(
                                      color: Colors.white60,
                                    ).copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.heightBox,
                      _DrawerTile(
                        icon: Icons.logout_rounded,
                        title: "Logout",
                        onTap: () {
                          // TODO: Clear Auth state
                          context.push(AppRoutes.loginScreenRoute);
                        },
                        color: Colors.redAccent.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  final Color? color;

  const _DrawerTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.accentGold.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: color ?? (isSelected ? AppColors.accentGold : Colors.white70),
          size: 22,
        ),
        title: Text(
          title,
          style: AppTextTheme.bodyMedium(
            color: color ?? (isSelected ? Colors.white : Colors.white70),
            weight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        visualDensity: const VisualDensity(vertical: -2),
      ),
    );
  }
}
