import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  final int quantity;

  const CartItemEntity({
    required this.product,
    this.quantity = 1,
  });

  CartItemEntity copyWith({
    ProductEntity? product,
    int? quantity,
  }) {
    return CartItemEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}
