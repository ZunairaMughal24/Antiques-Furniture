import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/product_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends HookWidget {
  final ProductEntity product;
  final String? heroTag;

  const ProductDetailScreen({super.key, required this.product, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final quantity = useState<int>(1);

    // Initial check for favorite status
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<FavoritesProvider>().checkFavoriteStatus(product.id);
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.48,
                elevation: 0,
                pinned: true,
                stretch: true,
                backgroundColor: Colors.white,
                leading: const SizedBox.shrink(),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                  ],
                  background: Hero(
                    tag: heroTag ?? product.id,
                    child: Image.asset(product.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.brown.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                product.category.toUpperCase(),
                                style: AppTextTheme.caption(
                                  color: Colors.brown,
                                  weight: FontWeight.bold,
                                ).copyWith(letterSpacing: 1.2),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 14,
                                ),
                                4.widthBox,
                                Text(
                                  "In Stock",
                                  style: AppTextTheme.bodySmall(
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        24.heightBox,
                        ProductDetailTitleAndPrice(product: product),
                        16.heightBox,
                        ProductDetailRatingAndMeta(product: product),
                        28.heightBox,
                        Divider(
                          color: Colors.black.withOpacity(0.05),
                          thickness: 1,
                        ),
                        28.heightBox,
                        Text(
                          "The Design Philosophy",
                          style: AppTextTheme.bodyLarge(
                            weight: FontWeight.bold,
                          ),
                        ),
                        12.heightBox,
                        Text(
                          product.description,
                          style: AppTextTheme.bodyMedium(
                            color: Colors.black.withOpacity(0.55),
                          ).copyWith(height: 1.7, letterSpacing: 0.1),
                        ),
                        32.heightBox,
                        ProductDetailQuantitySelector(quantity: quantity),
                        120.heightBox,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildFloatingNav(context),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ProductDetailBottomAction(
              product: product,
              quantity: quantity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingNav(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ProductDetailHeaderButtons(),
          FavoriteHeaderButton(product: product),
        ],
      ),
    );
  }
}
