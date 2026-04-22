import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/presentation/providers/home_provider.dart';
import 'package:antiques_furniture/widgets/add_to_cart_button.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NewCollectionRow extends StatelessWidget {
  const NewCollectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        final products = homeProvider.products;

        if (products.isEmpty) {
          return const SizedBox.shrink();
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: products.take(5).map((item) {
              final heroTag = 'new_collection_${item.id}';
              return Row(
                children: [
                  _FurnitureImageContainer(
                    product: item,
                    heroTag: heroTag,
                    onTap: () {
                      context.push(
                        AppRoutes.productDetailRoute,
                        extra: {
                          'product': item,
                          'heroTag': heroTag,
                        },
                      );
                    },
                  ),
                  20.widthBox,
                ],
              );
            }).toList(),
          ).pOnly(left: 16, top: 4, bottom: 4),
        );
      },
    );
  }
}

class _FurnitureImageContainer extends StatelessWidget {
  final ProductEntity product;
  final String heroTag;
  final VoidCallback onTap;

  const _FurnitureImageContainer({
    required this.product,
    required this.heroTag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        borderRadius: 24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 170,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      Hero(
                        tag: heroTag,
                        child: Image.asset(
                          product.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            product.category,
                            style: AppTextTheme.bodySmall(
                              weight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: AddToCartIconButton(product: product),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              width: 190,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextTheme.bodyMedium(
                      weight: FontWeight.w600,
                      color: Colors.black87,
                    ).copyWith(fontSize: 14),
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
                      Row(
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
