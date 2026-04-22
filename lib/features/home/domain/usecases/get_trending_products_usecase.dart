import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetTrendingProductsUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final HomeRepository repository;

  GetTrendingProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await repository.getTrendingProducts();
  }
}
