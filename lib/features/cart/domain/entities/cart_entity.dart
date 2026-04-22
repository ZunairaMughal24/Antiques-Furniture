import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> items;

  const CartEntity({this.items = const []});

  @override
  List<Object?> get props => [items];
}
