import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';
import 'package:antiques_furniture/features/categories/domain/usecases/get_photos_usecase.dart';
import 'package:flutter/material.dart';

enum CategoriesProviderState { initial, loading, loaded, error }

class CategoriesProvider extends ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  CategoriesProvider({required this.getPhotosUseCase});

  CategoriesProviderState _state = CategoriesProviderState.initial;
  CategoriesProviderState get state => _state;

  List<PhotoEntity> _photos = [];
  List<PhotoEntity> get photos => List.unmodifiable(_photos);

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loadPhotos() async {
    _state = CategoriesProviderState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _photos = await getPhotosUseCase();
      _state = CategoriesProviderState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = CategoriesProviderState.error;
    }
    notifyListeners();
  }
}
