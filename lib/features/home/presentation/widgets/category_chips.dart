import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/widgets/neumorphic_box.dart';
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
      height: 110,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final category = categoryList[index];

          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Column(
                children: [
                  NeumorphicBox(
                    borderRadius: 30,
                    depth: isSelected ? 2 : 8,
                    color: null,
                    padding: EdgeInsets.zero,
                    child: Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        category["icon"]!,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColors.primaryColor : Colors.black87,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  8.heightBox,

                  Text(
                    category["name"] as String,
                    style: AppTextTheme.bodySmall(
                      weight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? AppColors.primaryColor : Colors.black,
                    ).copyWith(fontSize: 12),
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
