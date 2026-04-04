import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CartSummaryCard extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final VoidCallback onCheckout;

  const CartSummaryCard({
    super.key,
    required this.subtotal,
    this.shipping = 20.0,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final total = subtotal + shipping;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _summaryRow("Subtotal", "\$$subtotal"),
          12.heightBox,
          _summaryRow("Shipping", "\$$shipping"),
          16.heightBox,
          const Divider(color: Color(0xFFEEEEEE)),
          16.heightBox,
          _summaryRow("Total", "\$$total", isTotal: true),
          24.heightBox,
          PrimaryButton(
            text: "Proceed to Checkout",
            onTap: onCheckout,
          ),
          8.heightBox,
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextTheme.bodyLarge(weight: FontWeight.bold)
              : AppTextTheme.bodyMedium(color: AppColors.lightGrey),
        ),
        Text(
          value,
          style: isTotal
              ? AppTextTheme.monoStyle(
                  fontSize: 20,
                  color: AppColors.pureBlack,
                  weight: FontWeight.bold,
                )
              : AppTextTheme.monoStyle(
                  fontSize: 16,
                  color: AppColors.pureBlack,
                  weight: FontWeight.w600,
                ),
        ),
      ],
    );
  }
}
