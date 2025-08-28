import 'dart:convert';
import 'package:antiques_furniture/features/categories/domain/entities/photo_entity.dart';
import 'package:antiques_furniture/features/categories/domain/models/photo_model.dart';
import 'package:antiques_furniture/features/categories/domain/repositories/photo_repository.dart';
import 'package:http/http.dart' as http;

class PhotoRepositoryImpl implements IPhotoRepository {
  final String baseUrl = "https://picsum.photos/v2/list";

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    final response = await http.get(Uri.parse(baseUrl));

    // final response = await http.get(
    //   Uri.parse(baseUrl),
    //   headers: {
    //     "Accept": "application/json",
    //     "Content-Type": "application/json",
    //   },
    // );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((json) => PhotoModel.fromJson(json).toEntity())
          .toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
