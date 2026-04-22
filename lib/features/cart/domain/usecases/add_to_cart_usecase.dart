import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/cart/domain/repositories/cart_repository.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

class AddToCartParams {
  final List<CartItemEntity> currentItems;
  final ProductEntity product;
  final int quantity;

  AddToCartParams({
    required this.currentItems,
    required this.product,
    this.quantity = 1,
  });
}

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, List<CartItemEntity>>> call(AddToCartParams params) async {
    final updatedItems = List<CartItemEntity>.from(params.currentItems);
    final index = updatedItems.indexWhere((item) => item.product.id == params.product.id);

    if (index != -1) {
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity + params.quantity,
      );
    } else {
      updatedItems.add(CartItemEntity(product: params.product, quantity: params.quantity));
    }

    final result = await repository.updateCartItems(updatedItems);
    
    return result.fold(
      (failure) => Left(failure),
      (_) => Right(updatedItems),
    );
  }
}
