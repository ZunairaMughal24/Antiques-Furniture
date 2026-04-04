import 'package:antiques_furniture/features/home/domain/models/home_model.dart';

class CartItemModel {
  final HomeItemModel product;
  int quantity;

  CartItemModel({required this.product, this.quantity = 1});

  double get totalPrice => (product.price * quantity).toDouble();
}

final List<CartItemModel> cartItems = [
  CartItemModel(product: homeItems[0], quantity: 1),
  CartItemModel(product: homeItems[2], quantity: 2),
  CartItemModel(product: homeItems[4], quantity: 1),
];
