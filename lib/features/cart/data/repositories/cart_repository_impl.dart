import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/cart/data/datasources/cart_datasource.dart';
import 'package:antiques_furniture/features/cart/domain/entities/cart_item_entity.dart';
import 'package:antiques_furniture/features/cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataSource dataSource;

  CartRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CartItemEntity>>> getCartItems() async {
    try {
      final items = await dataSource.getCartItems();
      return Right(items);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartItems(
    List<CartItemEntity> items,
  ) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
