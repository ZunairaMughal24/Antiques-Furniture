

import 'package:antiques_furniture/core/utils/app_images.dart';

class NewCollectionModel {
  final String image;
  final String name;
  final String category;
  final int price;
  final double rating;
  final String description;

  NewCollectionModel({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
  });
}

final List<NewCollectionModel> newCollectionItems = [
  NewCollectionModel(
    image: AppImages.new_collection_couch1,
    name: 'Luxury Couch',
    category: 'Living Room',
    price: 799,
    rating: 4.8,
    description:
        'A sleek and comfortable modern sofa made with premium fabric and sturdy wooden legs, perfect for any living room.',
  ),
  NewCollectionModel(
    image: AppImages.new_collection_couch2,
    name: 'Classic Sofa',
    category: 'Living Room',
    price: 650,
    rating: 4.7,
    description:
        'Elegant and timeless design with deep cushions and a durable frame for years of comfort.',
  ),
  NewCollectionModel(
    image: AppImages.sleek_beigh_couch,
    name: 'Modern Loveseat',
    category: 'Seating',
    price: 500,
    rating: 4.5,
    description:
        'Compact loveseat with a stylish design, ideal for apartments and cozy living spaces.',
  ),
  NewCollectionModel(
    image: AppImages.teal_couch,
    name: 'Elegant teal Couch',
    category: 'Seating',
    price: 850,
    rating: 4.6,
    description:
        'Fully cushioned recliner with adjustable backrest and leg support for maximum relaxation.',
  ),
  NewCollectionModel(
    image: AppImages.black_couch,
    name: 'Premium Recliner',
    category: 'Seating',
    price: 850,
    rating: 4.6,
    description:
        'Fully cushioned recliner with adjustable backrest and leg support for maximum relaxation.',
  ),
];
