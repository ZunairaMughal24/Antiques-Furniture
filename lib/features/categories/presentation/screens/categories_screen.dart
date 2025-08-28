import 'package:antiques_furniture/core/const/app_theme.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/categories/domain/models/categories_model.dart';
import 'package:antiques_furniture/features/categories/presentation/widgets/categories_widget.dart';
import 'package:antiques_furniture/features/categories/presentation/widgets/product_card.dart';
import 'package:antiques_furniture/widgets/primary_appbar.dart';
import 'package:flutter/material.dart' hide IconButton;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedCategory = "Sofa"; // default

  // Map your category names to their icon images
  final Map<String, String> categoryImages = {
    "Sofa": AppImages.splash1,
    "Bed": AppImages.bed_icon,
    "Table": AppImages.table_icon,
    "Chair": AppImages.chair_icon,
    "Cupboard": AppImages.bed_icon, // replace with actual
    "Dressing": AppImages.dressing_icon, // replace with actual
  };

  @override
  Widget build(BuildContext context) {
    final products = productsByCategory[selectedCategory]!;

    return Scaffold(
      appBar: PrimaryAppBar(title: "Store"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.heightBox,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productsByCategory.keys.map((category) {
                return IconButton(
                  imagePath: categoryImages[category]!,
                  isSelected: category == selectedCategory,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                );
              }).toList(),
            ).px8(),
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals ",
                style: AppTextTheme.labelLarge(weight: FontWeight.w600),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                ),
                width: 38,
                height: 38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.filter_icon,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ).px12(),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
