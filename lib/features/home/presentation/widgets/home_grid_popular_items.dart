import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeGridNoScroll extends StatelessWidget {
  final List<ProductEntity> items;
  const HomeGridNoScroll({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => context.push(
            AppRoutes.popularItemsDetailScreenRoute,
            extra: item,
          ),
          child: AppContainer(
            borderRadius: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.asset(
                          item.image,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: GestureDetector(
                            onTap: () {
                              context.read<CartProvider>().addItem(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${item.name} added to cart!'),
                                  backgroundColor: AppColors.primaryColor,
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: AppColors.primaryColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    item.name,
                    style: AppTextTheme.bodyMedium(
                      weight: FontWeight.w500,
                    ).copyWith(fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    item.category,
                    style: AppTextTheme.bodySmall(
                      color: AppColors.lightGrey,
                    ).copyWith(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$${item.price}',
                          style: AppTextTheme.monoStyle(
                            fontSize: 15,
                            color: AppColors.primaryColor,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        rating: item.rating,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 252, 194, 23),
                        ),
                        itemCount: 5,
                        itemSize: 12.0,
                        direction: Axis.horizontal,
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
