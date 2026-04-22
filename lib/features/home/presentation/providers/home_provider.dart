import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/banner_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/category_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:antiques_furniture/features/home/domain/repositories/home_repository.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_trending_products_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/get_products_by_category_usecase.dart';
import 'package:antiques_furniture/features/home/domain/usecases/search_products_usecase.dart';
import 'package:flutter/material.dart';

enum HomeState { initial, loading, loaded, error }

class HomeProvider extends ChangeNotifier {
  final GetBannersUseCase getBannersUseCase;
  final GetTrendingProductsUseCase getTrendingProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;
  final SearchProductsUseCase searchProductsUseCase;

  HomeProvider({
    required this.getBannersUseCase,
    required this.getTrendingProductsUseCase,
    required this.getCategoriesUseCase,
    required this.getProductsByCategoryUseCase,
    required this.searchProductsUseCase,
  });

  HomeState _state = HomeState.initial;
  HomeState get state => _state;

  List<BannerEntity> _banners = [];
  List<BannerEntity> get banners => List.unmodifiable(_banners);

  List<ProductEntity> _products = [];
  List<ProductEntity> get products => List.unmodifiable(_products);

  List<CategoryEntity> _categories = [];
  List<CategoryEntity> get categories => List.unmodifiable(_categories);

  List<ProductEntity> _categoryProducts = [];
  List<ProductEntity> get categoryProducts =>
      List.unmodifiable(_categoryProducts);

  String _selectedCategoryId = '';
  String get selectedCategoryId => _selectedCategoryId;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void selectCategory(String id) {
    _selectedCategoryId = id;
    notifyListeners();
    // Fetch products for this category
    final category = _categories.firstWhere(
      (c) => c.id == id,
      orElse: () => const CategoryEntity(id: '', name: '', icon: ''),
    );
    if (category.name.isNotEmpty) {
      loadProductsByCategory(category.name);
    }
  }

  Future<void> initHome() async {
    _state = HomeState.loading;
    _errorMessage = '';
    notifyListeners();

    final bannersResult = await getBannersUseCase(NoParams());
    if (bannersResult.isLeft()) {
      _state = HomeState.error;
      _errorMessage = bannersResult.fold((f) => f.message, (_) => '');
      notifyListeners();
      return;
    }
    _banners = bannersResult.getOrElse(() => []);

    final productsResult = await getTrendingProductsUseCase(NoParams());
    if (productsResult.isLeft()) {
      _state = HomeState.error;
      _errorMessage = productsResult.fold((f) => f.message, (_) => '');
      notifyListeners();
      return;
    }
    _products = productsResult.getOrElse(() => []);

    final categoriesResult = await getCategoriesUseCase(NoParams());
    if (categoriesResult.isLeft()) {
      _state = HomeState.error;
      _errorMessage = categoriesResult.fold((f) => f.message, (_) => '');
      notifyListeners();
      return;
    }
    _categories = categoriesResult.getOrElse(() => []);

    if (_categories.isNotEmpty && _selectedCategoryId.isEmpty) {
      _selectedCategoryId = _categories.first.id;
      loadProductsByCategory(_categories.first.name);
    }

    _state = HomeState.loaded;
    notifyListeners();
  }

  Future<void> ensureInitialized() async {
    if (_state == HomeState.initial || _categories.isEmpty) {
      await initHome();
    }
  }

  Future<void> loadProductsByCategory(String categoryName) async {
    final result = await getProductsByCategoryUseCase(
      CategoryProductsParams(categoryName: categoryName),
    );
    result.fold(
      (failure) => _errorMessage = failure.message,
      (products) => _categoryProducts = products,
    );
    notifyListeners();
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      if (_categories.isNotEmpty) {
        loadProductsByCategory(_categories.first.name);
      }
      return;
    }

    _state = HomeState.loading;
    notifyListeners();

    final result = await searchProductsUseCase(query);
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _state = HomeState.error;
      },
      (products) {
        _categoryProducts = products;
        _state = HomeState.loaded;
      },
    );
    notifyListeners();
  }
}
