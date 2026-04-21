import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:flutter/material.dart';

import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryFilterChips extends StatefulWidget {
  const CategoryFilterChips({super.key});

  @override
  State<CategoryFilterChips> createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  int selectedIndex = 0;

  final List<Map<String, String>> categoryList = <Map<String, String>>[
    {"name": "Sofa", "icon": AppImages.svg_sofa},
    {"name": "Bed", "icon": AppImages.svg_bed},
    {"name": "Table", "icon": AppImages.svg_table},
    {"name": "Chair", "icon": AppImages.svg_chair},
    {"name": "Cupboard", "icon": AppImages.svg_cupboard},
    {"name": "Dressing", "icon": AppImages.svg_dressing},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // Increased to prevent overflow
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final category = categoryList[index];

          return Padding(
            padding: const EdgeInsets.only(right: 22),
            child: GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Column(
                children: [
                  AppContainer(
                    borderRadius: 15, // Slightly less rounded for smaller size
                    color: isSelected ? AppColors.accentGold.withOpacity(0.1) : AppColors.neumorphicBase,
                    boxShadow: isSelected ? [] : null,
                    border: isSelected ? Border.all(color: AppColors.accentGold, width: 2) : null,
                    child: Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        category["icon"]!,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColors.accentGold : Colors.black87,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  10.heightBox,

                  Text(
                    category["name"] as String,
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
  }
}
