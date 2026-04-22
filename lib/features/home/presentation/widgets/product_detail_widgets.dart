import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/widgets/add_to_cart_button.dart';
import 'package:antiques_furniture/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class ProductDetailHeaderButtons extends StatelessWidget {
  const ProductDetailHeaderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _BlurredCircularButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: null,
        ),
        Consumer<FavoritesProvider>(
          builder: (context, favorites, _) {
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class FavoriteHeaderButton extends StatelessWidget {
  final ProductEntity product;
  const FavoriteHeaderButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favorites, _) {
        final isFav = favorites.isFavorite(product.id);
        return _BlurredCircularButton(
          icon: isFav ? Icons.favorite : Icons.favorite_border,
          iconColor: isFav ? Colors.red : Colors.black,
          onTap: () => favorites.toggleFavorite(product),
        );
      },
    );
  }
}

class ProductDetailTitleAndPrice extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailTitleAndPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product.name,
            style: AppTextTheme.h2(
              weight: FontWeight.bold,
            ).copyWith(fontSize: 30, letterSpacing: -0.8),
          ),
        ),
        16.widthBox,
        Text(
          '\$${product.price}',
          style: AppTextTheme.h3(
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
          ).copyWith(fontSize: 24),
        ),
      ],
    );
  }
}

class ProductDetailRatingAndMeta extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailRatingAndMeta({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: product.rating,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Color(0xFFFFC107)),
          itemCount: 5,
          itemSize: 20.0,
        ),
        10.widthBox,
        Text(
          "${product.rating}",
          style: AppTextTheme.bodyMedium(weight: FontWeight.bold),
        ),
        6.widthBox,
        Expanded(
          child: Text(
            "(120 Verified Reviews)",
            style: AppTextTheme.bodySmall(color: Colors.black45),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ProductDetailQuantitySelector extends StatelessWidget {
  final ValueNotifier<int> quantity;
  const ProductDetailQuantitySelector({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.04),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Quantity",
                  style: AppTextTheme.bodySmall(color: Colors.black45),
                ),
                4.heightBox,
                Text(
                  "Adjust for your home",
                  style: AppTextTheme.bodyMedium(weight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          12.widthBox,
          QuantitySelector(
            quantity: quantity.value,
            onIncrease: () => quantity.value++,
            onDecrease: () {
              if (quantity.value > 1) {
                quantity.value--;
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProductDetailBottomAction extends StatelessWidget {
  final ProductEntity product;
  final ValueNotifier<int> quantity;

  const ProductDetailBottomAction({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(28, 20, 28, 20 + bottomPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Final Price",
                style: AppTextTheme.bodySmall(color: Colors.black38),
              ),
              Text(
                "\$${product.price * quantity.value}",
                style: AppTextTheme.h4(weight: FontWeight.bold),
              ),
            ],
          ),
          24.widthBox,
          Expanded(
            child: AddToCartButton(
              product: product,
              quantity: quantity.value,
              text: 'Order Now',
            ),
          ),
        ],
      ),
    );
  }
}

class _BlurredCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color? iconColor;

  const _BlurredCircularButton({
    required this.icon,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: onTap ?? () => context.pop(),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor ?? Colors.black, size: 22),
          ),
        ),
      ),
    );
  }
}
