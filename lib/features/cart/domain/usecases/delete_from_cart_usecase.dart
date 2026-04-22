import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteFromCartParams {
  final List<CartItemEntity> currentItems;
  final String productId;

  DeleteFromCartParams({
    required this.currentItems,
    required this.productId,
  });
}

class DeleteFromCartUseCase {
  final CartRepository repository;

  DeleteFromCartUseCase(this.repository);

  Future<Either<Failure, List<CartItemEntity>>> call(DeleteFromCartParams params) async {
    final updatedItems = List<CartItemEntity>.from(params.currentItems);
    updatedItems.removeWhere((item) => item.product.id == params.productId);

    final result = await repository.updateCartItems(updatedItems);
    
    return result.fold(
      (failure) => Left(failure),
      (_) => Right(updatedItems),
    );
  }
}
