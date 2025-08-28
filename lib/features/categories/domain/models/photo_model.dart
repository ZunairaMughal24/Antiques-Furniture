// import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';

// /// Data Layer: Model
// /// Represents how the photo is received from API (JSON).
// class PhotoModel {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   const PhotoModel({
//     required this.albumId,
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.thumbnailUrl,
//   });

//   /// Factory constructor to create a [PhotoModel] from JSON (API response)
//   factory PhotoModel.fromJson(Map<String, dynamic> json) {
//     return PhotoModel(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }

//   /// Converts [PhotoModel] into JSON (useful if sending data back to API)
//   Map<String, dynamic> toJson() {
//     return {
//       'albumId': albumId,
//       'id': id,
//       'title': title,
//       'url': url,
//       'thumbnailUrl': thumbnailUrl,
//     };
//   }
// }

// /// Extension method to map [PhotoModel] -> [PhotoEntity]
// extension PhotoModelX on PhotoModel {
//   PhotoEntity toEntity() {
//     return PhotoEntity(
//       albumId: albumId,
//       id: id,
//       title: title,
//       url: url,
//       thumbnailUrl: thumbnailUrl,
//     );
//   }
// }
import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';

class PhotoModel {
  final String id;
  final String? author;
  final String? url;

  final int width;
  final int height;

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
      id: json['id'].toString(),
      author: json['author'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? '',
      downloadUrl: json['download_url'] ?? '', // 👈 MUST be this key
    );
  }

  PhotoEntity toEntity() {
    return PhotoEntity(
      id: id,
      author: author ?? "Unknown",
      width: width,
      height: height,
      url: url ?? "unknown",
      downloadUrl: downloadUrl,
    );
  }
}
