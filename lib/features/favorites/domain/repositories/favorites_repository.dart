import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:antiques_furniture/core/errors/failures.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
  Future<Either<Failure, bool>> toggleFavorite(ProductEntity product);
  Future<Either<Failure, bool>> isFavorite(String productId);
}
