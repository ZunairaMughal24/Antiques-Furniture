import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String category;
  final String image;
  final int price;
  final double rating;
  final String description;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, category, image, price, rating, description];
}
