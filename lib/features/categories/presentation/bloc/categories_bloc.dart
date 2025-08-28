
import 'package:antiques_furniture/features/categories/presentation/bloc/events.dart';
import 'package:antiques_furniture/features/categories/presentation/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/photo_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final IPhotoRepository photoRepository;

  PhotoBloc(this.photoRepository) : super(PhotoInitial()) {
    on<LoadPhotosEvent>((event, emit) async {
      emit(PhotoLoading());
      try {
        final photos = await photoRepository.getPhotos();
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError(e.toString()));
      }
    });
  }
}
