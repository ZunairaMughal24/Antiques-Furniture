import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class SearchProductsUseCase implements UseCase<List<ProductEntity>, String> {
  final HomeRepository repository;

  SearchProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String query) async {
    return await repository.searchProducts(query);
  }
}
