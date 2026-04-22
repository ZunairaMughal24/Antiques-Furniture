import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItemEntity>>> getCartItems();
  Future<Either<Failure, void>> updateCartItems(List<CartItemEntity> items);
}
