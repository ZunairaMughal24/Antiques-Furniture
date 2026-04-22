import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

class ToggleFavoriteUseCase implements UseCase<bool, ProductEntity> {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ProductEntity params) async {
    return await repository.toggleFavorite(params);
  }
}
