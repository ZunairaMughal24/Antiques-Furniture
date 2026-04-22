import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveFromCartParams {
  final List<CartItemEntity> currentItems;
  final String productId;

  RemoveFromCartParams({
    required this.currentItems,
    required this.productId,
  });
}

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<Either<Failure, List<CartItemEntity>>> call(RemoveFromCartParams params) async {
    final updatedItems = List<CartItemEntity>.from(params.currentItems);
    final index = updatedItems.indexWhere((item) => item.product.id == params.productId);

    if (index != -1) {
      if (updatedItems[index].quantity > 1) {
        updatedItems[index] = updatedItems[index].copyWith(
          quantity: updatedItems[index].quantity - 1,
        );
      } else {
        updatedItems.removeAt(index);
      }

      final result = await repository.updateCartItems(updatedItems);
      
      return result.fold(
        (failure) => Left(failure),
        (_) => Right(updatedItems),
      );
    }
    
    return Right(updatedItems);
  }
}
