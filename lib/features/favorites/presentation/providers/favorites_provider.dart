import 'package:antiques_furniture/core/usecases/usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/is_favorite_usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesProvider({
    required this.toggleFavoriteUseCase,
    required this.isFavoriteUseCase,
    required this.getFavoritesUseCase,
  });

  final Map<String, bool> _favoriteStatuses = {};
  List<ProductEntity> _favorites = [];

  bool isFavorite(String productId) => _favoriteStatuses[productId] ?? false;
  List<ProductEntity> get favorites => _favorites;

  Future<void> loadFavorites() async {
    final result = await getFavoritesUseCase(NoParams());
    result.fold(
      (failure) => null,
      (favs) {
        _favorites = favs;
        for (var p in favs) {
          _favoriteStatuses[p.id] = true;
        }
        notifyListeners();
      },
    );
  }

  Future<void> checkFavoriteStatus(String productId) async {
    final result = await isFavoriteUseCase(productId);
    result.fold(
      (failure) => null,
      (isFav) {
        _favoriteStatuses[productId] = isFav;
        notifyListeners();
      },
    );
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    final result = await toggleFavoriteUseCase(product);
    result.fold(
      (failure) => null,
      (isFavNow) {
        _favoriteStatuses[product.id] = isFavNow;
        if (isFavNow) {
          if (!_favorites.any((p) => p.id == product.id)) {
            _favorites.add(product);
          }
        } else {
          _favorites.removeWhere((p) => p.id == product.id);
        }
        notifyListeners();
      },
    );
  }
}
