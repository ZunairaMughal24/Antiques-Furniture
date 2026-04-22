import 'package:antiques_furniture/features/favorites/domain/usecases/is_favorite_usecase.dart';
import 'package:antiques_furniture/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

class FavoritesProvider extends ChangeNotifier {
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  FavoritesProvider({
    required this.toggleFavoriteUseCase,
    required this.isFavoriteUseCase,
  });

  final Map<String, bool> _favoriteStatuses = {};

  bool isFavorite(String productId) => _favoriteStatuses[productId] ?? false;

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
        notifyListeners();
      },
    );
  }
}
