import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';

class CartTotals {
  final double subtotal;
  final double shipping;
  final double total;

  CartTotals({
    required this.subtotal,
    required this.shipping,
    required this.total,
  });
}

class CalculateCartTotalsUseCase {
  CartTotals call(List<CartItemEntity> items) {
    final subtotal = items.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );

    //$20 flat rate shipping
    final shipping = items.isEmpty ? 0.0 : 20.0;

    final total = subtotal + shipping;

    return CartTotals(subtotal: subtotal, shipping: shipping, total: total);
  }
}
