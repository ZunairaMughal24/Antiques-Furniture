import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/presentation/providers/home_provider.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoryFilterChips extends StatelessWidget {
  const CategoryFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (homeProvider.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 110,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.categories.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemBuilder: (context, index) {
              final category = homeProvider.categories[index];
              final isSelected = homeProvider.selectedCategoryId == category.id;

              return Padding(
                padding: const EdgeInsets.only(right: 22),
                child: GestureDetector(
                  onTap: () => homeProvider.selectCategory(category.id),
                  child: Column(
                    children: [
                      AppContainer(
                        borderRadius: 15,
                        color: isSelected
                            ? AppColors.accentGold.withOpacity(0.1)
                            : AppColors.neumorphicBase,
                        boxShadow: isSelected ? [] : null,
                        border: isSelected
                            ? Border.all(color: AppColors.accentGold, width: 2)
                            : null,
                        child: Container(
                          width: 55,
                          height: 55,
                          padding: const EdgeInsets.all(14),
                          child: SvgPicture.asset(
                            category.icon,
                            colorFilter: ColorFilter.mode(
                              isSelected ? AppColors.accentGold : Colors.black87,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      10.heightBox,
                      Text(
                        category.name,
                        style: AppTextTheme.bodyMedium(
                          weight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? AppColors.accentGold : Colors.black54,
                        ).copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

