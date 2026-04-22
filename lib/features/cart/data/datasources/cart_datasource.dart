import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';

abstract class CartDataSource {
  Future<List<CartItemEntity>> getCartItems();
}

class CartDataSourceImpl implements CartDataSource {
  @override
  Future<List<CartItemEntity>> getCartItems() async {
    // Mock initial cart items
    return [
      CartItemEntity(
        product: ProductEntity(
          id: '1',
          name: 'Luxury Couch',
          category: 'Living Room',
          image: AppImages.new_collection_couch1,
          price: 799,
          rating: 4.8,
          description: 'A sleek and comfortable modern sofa made with premium fabric.',
        ),
        quantity: 1,
      ),
      CartItemEntity(
        product: ProductEntity(
          id: '2',
          name: 'King Size Bed',
          category: 'Bedroom',
          image: AppImages.bed1,
          price: 1200,
          rating: 4.7,
          description: 'Spacious and luxurious king-size bed.',
        ),
        quantity: 1,
      ),
    ];
  }
}
