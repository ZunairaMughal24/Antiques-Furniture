import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/cart/domain/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final VoidCallback? onDelete;

  const CartItemCard({
    super.key,
    required this.item,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.product.image,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),

          12.widthBox,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.product.name,
                  style: AppTextTheme.bodyLarge(weight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.heightBox,
                Text(
                  item.product.category,
                  style: AppTextTheme.bodySmall(color: AppColors.lightGrey),
                ),
                8.heightBox,
                Text(
                  "\$${item.product.price}",
                  style: AppTextTheme.monoStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete_outline,
                  color: AppColors.errorRed,
                  size: 20,
                ),
              ),
              Row(
                children: [
                  _quantityButton(Icons.remove, onRemove),
                  Text(
                    "${item.quantity}",
                    style: AppTextTheme.bodyMedium(weight: FontWeight.bold),
                  ).px12(),
                  _quantityButton(Icons.add, onAdd),
                ],
              ),
            ],
          ).pOnly(right: 8, bottom: 8),
        ],
      ).p8(),
    ).py8();
  }

  Widget _quantityButton(IconData icon, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: AppColors.primaryColor),
      ),
    );
  }
}
