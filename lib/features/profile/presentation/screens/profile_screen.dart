import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/profile/presentation/widgets/profile_option_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 235),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileHeader(),

            24.heightBox,

            _profileOptions(context),

            32.heightBox,
          ],
        ),
      ).safeArea(),
    );
  }

  Widget _profileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.1),
              border: Border.all(color: AppColors.primaryColor, width: 2),
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: AppColors.primaryColor,
            ),
          ),

          16.heightBox,

          Text(
            "Zunaira Mughal",
            style: AppTextTheme.h4(weight: FontWeight.bold),
          ),

          4.heightBox,

          Text(
            "zunaira.mughal@example.com",
            style: AppTextTheme.bodySmall(color: AppColors.lightGrey),
          ),
        ],
      ),
    );
  }

  Widget _profileOptions(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          ProfileOptionTile(
            icon: Icons.shopping_bag_outlined,
            title: "My Orders",
            onTap: () {},
          ),
          ProfileOptionTile(
            icon: Icons.location_on_outlined,
            title: "Shipping Address",
            onTap: () {},
          ),
          ProfileOptionTile(
            icon: Icons.payment_outlined,
            title: "Payment Methods",
            onTap: () {},
          ),
          ProfileOptionTile(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onTap: () {},
          ),
          ProfileOptionTile(
            icon: Icons.logout_outlined,
            title: "Logout",
            iconColor: AppColors.errorRed,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
