import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/cart/presentation/providers/cart_provider.dart';
import 'package:antiques_furniture/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:antiques_furniture/features/cart/presentation/widgets/cart_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

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
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.state == CartState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cartProvider.items.isEmpty) {
            return Center(
              child: Text(
                "Your cart is empty",
                style: AppTextTheme.bodyLarge(color: Colors.grey),
              ),
            );
          }

          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 250,
                ),
                itemCount: cartProvider.items.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = cartProvider.items[index];
                  return CartItemCard(
                    item: item,
                    onAdd: () => cartProvider.addItem(item.product),
                    onRemove: () => cartProvider.removeItem(item.product.id),
                    onDelete: () => cartProvider.deleteItem(item.product.id),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CartSummaryCard(
                  subtotal: cartProvider.subtotal,
                  shipping: cartProvider.shipping,
                  onCheckout: () {
                    // Navigate to checkout or show snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Checkout functional implementation coming soon!")),
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
