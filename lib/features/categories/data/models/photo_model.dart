import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';

class PhotoModel {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  PhotoModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      author: json['author'],
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? '',
      downloadUrl: json['download_url'] ?? '',
    );
  }

  PhotoEntity toEntity() {
    return PhotoEntity(
      id: id,
      author: author,
      width: width,
      height: height,
      url: url,
      downloadUrl: downloadUrl,
    );
  }
}
