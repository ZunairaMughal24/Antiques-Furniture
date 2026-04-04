import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/cart/domain/models/cart_model.dart';
import 'package:antiques_furniture/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:antiques_furniture/features/cart/presentation/widgets/cart_summary_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 235),
      appBar: AppBar(
        title: Text("My Cart", style: AppTextTheme.h4(weight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: 250,
            ),
            itemCount: cartItems.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CartItemCard(
                item: cartItems[index],
                onAdd: () {},
                onRemove: () {},
                onDelete: () {},
              );
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CartSummaryCard(
              subtotal: 2249.00,
              shipping: 20.0,
              onCheckout: () {},
            ),
          ),
        ],
      ),
    );
  }
}
