import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/widgets/primary_button1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  final ProductEntity product;
  final int quantity;
  final String? text;
  final VoidCallback? onAfterAdd;

  const AddToCartButton({
    super.key,
    required this.product,
    this.quantity = 1,
    this.text,
    this.onAfterAdd,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: () async {
        final cartProvider = context.read<CartProvider>();
        bool shouldAdd = true;

        if (cartProvider.isInCart(product.id)) {
          shouldAdd = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    "Already in Cart",
                    style: AppTextTheme.h4(weight: FontWeight.bold),
                  ),
                  content: Text(
                    "${product.name} is already in your cart. Would you like to add more?",
                    style: AppTextTheme.bodyMedium(color: Colors.black54),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        "Cancel",
                        style: AppTextTheme.bodyMedium(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        "Add More",
                        style: AppTextTheme.bodyMedium(
                          color: AppColors.primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ) ??
              false;
        }

        if (shouldAdd) {
          cartProvider.addItem(
            product,
            quantity: quantity,
          );

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.check_circle_outline,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '${product.name} added to cart!',
                        style: AppTextTheme.bodyMedium(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                backgroundColor: AppColors.primaryColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.all(20),
                duration: const Duration(seconds: 2),
              ),
            );
          }
          onAfterAdd?.call();
        }
      },
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Text(
              text ?? 'Add to Cart',
              style: AppTextTheme.bodyLarge(
                color: Colors.white,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartIconButton extends StatelessWidget {
  final ProductEntity product;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;

  const AddToCartIconButton({
    super.key,
    required this.product,
    this.backgroundColor,
    this.iconColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final cartProvider = context.read<CartProvider>();
        bool shouldAdd = true;

        if (cartProvider.isInCart(product.id)) {
          shouldAdd = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    "Already in Cart",
                    style: AppTextTheme.h4(weight: FontWeight.bold),
                  ),
                  content: Text(
                    "${product.name} is already in your cart. Would you like to add more?",
                    style: AppTextTheme.bodyMedium(color: Colors.black54),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        "Cancel",
                        style: AppTextTheme.bodyMedium(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        "Add More",
                        style: AppTextTheme.bodyMedium(
                          color: AppColors.primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ) ??
              false;
        }

        if (shouldAdd) {
          cartProvider.addItem(product);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${product.name} added to cart!'),
                backgroundColor: AppColors.primaryColor,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 1),
              ),
            );
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.shopping_bag_outlined,
          color: iconColor ?? AppColors.primaryColor,
          size: size ?? 16,
        ),
      ),
    );
  }
}
