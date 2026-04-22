import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:dartz/dartz.dart';

class IsFavoriteUseCase implements UseCase<bool, String> {
  final FavoritesRepository repository;

  IsFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await repository.isFavorite(params);
  }
}
