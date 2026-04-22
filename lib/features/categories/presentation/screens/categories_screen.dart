import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/presentation/providers/home_provider.dart';
import 'package:antiques_furniture/features/categories/presentation/widgets/categories_widget.dart';
import 'package:antiques_furniture/features/categories/presentation/widgets/product_card.dart';
import 'package:antiques_furniture/widgets/primary_appbar.dart';
import 'package:flutter/material.dart' hide IconButton;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().ensureInitialized();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neumorphicBase,
      appBar: PrimaryAppBar(title: "Store"),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.state == HomeState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (homeProvider.state == HomeState.error) {
            return Center(child: Text(homeProvider.errorMessage));
          }

          final categories = homeProvider.categories;
          final products = homeProvider.categoryProducts;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.heightBox,
              // Category Selection Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: categories.map((category) {
                    return CategoryIconButton(
                      imagePath: category.icon,
                      isSelected: category.id == homeProvider.selectedCategoryId,
                      onTap: () => homeProvider.selectCategory(category.id),
                    );
                  }).toList(),
                ).px16(),
              ),
              24.heightBox,
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style: AppTextTheme.h4(weight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    width: 42,
                    height: 42,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        AppImages.filter_icon,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ).px16(),
              
              Expanded(
                child: products.isEmpty
                    ? Center(
                        child: Text(
                          "No products found in this category",
                          style: AppTextTheme.bodyLarge(color: AppColors.lightGrey),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final item = products[index];
                          return ProductCard(
                            product: item,
                            onTap: () {
                              context.push(
                                AppRoutes.popularItemsDetailScreenRoute,
                                extra: item,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
