import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:antiques_furniture/features/favorites/presentation/widgets/wishlist_item_card.dart';
import 'package:antiques_furniture/config/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<FavoritesProvider>().loadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "My Wishlist",
          style: AppTextTheme.h4(weight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
        child: Consumer<FavoritesProvider>(
          builder: (context, favoritesProvider, child) {
            final items = favoritesProvider.favorites;

            if (items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite_outline_rounded,
                      size: 64,
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "No saved pieces yet",
                      style: AppTextTheme.h4(color: Colors.black26),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                final heroTag = 'wishlist_immersive_${product.id}';

                return WishlistItemCard(
                  product: product,
                  heroTag: heroTag,
                  onTap: () {
                    context.push(
                      AppRoutes.productDetailRoute,
                      extra: {'product': product, 'heroTag': heroTag},
                    );
                  },
                  onRemove: () => favoritesProvider.toggleFavorite(product),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
