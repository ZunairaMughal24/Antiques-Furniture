import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      borderRadius: 30,
      margin: const EdgeInsets.all(16),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, Icons.home, 0, 'Home'),
            _buildNavItem(Icons.grid_view, Icons.grid_view_sharp, 1, 'Store'),
            _buildNavItem(
              Icons.shopping_cart_outlined,
              Icons.shopping_cart,
              2,
              'Cart',
            ),
            _buildNavItem(Icons.person_outline, Icons.person, 3, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    IconData activeIcon,
    int index,
    String label,
  ) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? AppColors.primaryColor : AppColors.lightGrey,
            size: 26,
          ),
          if (isSelected) ...[
            4.heightBox,
            Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
