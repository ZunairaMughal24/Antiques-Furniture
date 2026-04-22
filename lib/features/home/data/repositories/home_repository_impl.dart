import 'package:antiques_furniture/core/errors/failures.dart';
import 'package:antiques_furniture/features/home/data/datasources/home_datasource.dart';
import 'package:antiques_furniture/features/home/domain/entities/banner_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/category_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      final banners = await dataSource.getBanners();
      return Right(banners);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts() async {
    try {
      final products = await dataSource.getTrendingProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await dataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String categoryName) async {
    try {
      final products = await dataSource.getProductsByCategory(categoryName);
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query) async {
    try {
      final products = await dataSource.searchProducts(query);
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
