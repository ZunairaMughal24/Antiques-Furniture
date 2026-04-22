import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetProductsByCategoryUseCase implements UseCase<List<ProductEntity>, CategoryProductsParams> {
  final HomeRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(CategoryProductsParams params) async {
    return await repository.getProductsByCategory(params.categoryName);
  }
}

class CategoryProductsParams extends Equatable {
  final String categoryName;

  const CategoryProductsParams({required this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}
