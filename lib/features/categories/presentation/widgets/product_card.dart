import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    product.image,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () {
                      context.read<CartProvider>().addItem(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} added to cart!'),
                          backgroundColor: AppColors.primaryColor,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Text(
                product.category,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.lightGrey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  RatingBarIndicator(
                    rating: product.rating,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 252, 194, 23),
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
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
