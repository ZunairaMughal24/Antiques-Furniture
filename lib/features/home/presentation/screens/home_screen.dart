import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/models/banner_model.dart';
import 'package:antiques_furniture/features/home/domain/models/new_collection_model.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/category_chips.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_header.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_widget.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:antiques_furniture/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neumorphicBase,
      drawer: const Drawer(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),

              16.heightBox,

              PromotionalBannerSlider(banners: banners).px16(),

              24.heightBox,

              const SectionHeader(
                title: "Categories",
                actionText: "view all",
              ).px16(),
              8.heightBox,
              const CategoryFilterChips(),

              16.heightBox,

              const SectionHeader(title: "Collections").px16(),
              16.heightBox,

              // Grid for Collections like the image
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68, // Taller card to prevent overflow
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  final item = newCollectionItems[index];
                  return _CollectionCard(product: item);
                },
              ),

              40.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final NewCollectionModel product;
  const _CollectionCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      borderRadius: 24,
      borderColor: Colors.white,
      borderWidth: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image with circular border from all sides
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 130, // Slightly reduced to fit padding
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.asset(
                      product.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          product.category,
                          style: AppTextTheme.bodySmall(
                            weight: FontWeight.w600,
                            color: Colors.white,
                          ).copyWith(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content section with padding
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextTheme.bodySmall(
                    weight: FontWeight.w600,
                    color: Colors.black87,
                  ).copyWith(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                8.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: AppTextTheme.bodyMedium(
                        weight: FontWeight.w700,
                        color: AppColors.accentGold,
                      ).copyWith(fontSize: 15),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: index < product.rating.floor()
                                ? AppColors.accentGold
                                : Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
