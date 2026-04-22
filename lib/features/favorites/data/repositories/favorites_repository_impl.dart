import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  static final List<ProductEntity> _favorites = [];

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      return Right(List.from(_favorites));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String productId) async {
    try {
      final isFav = _favorites.any((p) => p.id == productId);
      return Right(isFav);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(ProductEntity product) async {
    try {
      final index = _favorites.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        _favorites.removeAt(index);
        return const Right(false);
      } else {
        _favorites.add(product);
        return const Right(true);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
