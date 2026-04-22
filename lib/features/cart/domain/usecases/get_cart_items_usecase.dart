import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetCartItemsUseCase implements UseCase<List<CartItemEntity>, NoParams> {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartItemEntity>>> call(NoParams params) async {
    return await repository.getCartItems();
  }
}
