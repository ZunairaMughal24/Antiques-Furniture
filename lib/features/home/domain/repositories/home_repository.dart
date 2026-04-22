import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/home/domain/entities/banner_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/category_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String categoryName);
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);
}
