

import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';
abstract class IPhotoRepository {
  Future<List<PhotoEntity>> getPhotos();
}
