import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';
import 'package:antiques_furniture/features/categories/domain/repositories/photo_repository.dart';

class GetPhotosUseCase {
  final IPhotoRepository repository;

  GetPhotosUseCase(this.repository);

  Future<List<PhotoEntity>> call() async {
    return await repository.getPhotos();
  }
}
