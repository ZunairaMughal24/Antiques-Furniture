import 'package:antiques_furniture/core/utils/app_images.dart';

class HomeItemModel {
  final String image;
  final String name;
  final String category;
  final int price;
  final double rating;
  final String description;

  HomeItemModel({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
  });
}

final List<HomeItemModel> homeItems = [
  HomeItemModel(
    image: AppImages.chair2,
    name: 'Modern Sofa',
    category: 'Living Room',
    price: 799,
    rating: 4.8,
    description:
        'A sleek and comfortable modern sofa made with premium fabric and sturdy wooden legs, perfect for any living room.',
  ),
  HomeItemModel(
    image: AppImages.table1,
    name: 'Wooden Table',
    category: 'Study',
    price: 1200,
    rating: 4.7,
    description:
        'Spacious and luxurious table with a solid frame and elegant headboard design for ultimate comfort.',
  ),
  HomeItemModel(
    image: AppImages.bed1,
    name: 'King Size Bed',
    category: 'Bedroom',
    price: 1200,
    rating: 4.7,
    description:
        'Spacious and luxurious king-size bed with a solid frame and elegant headboard design for ultimate comfort.',
  ),
  HomeItemModel(
    image: AppImages.sleek_beigh_couch,
    name: 'Vintage Chair',
    category: 'Seating',
    price: 250,
    rating: 4.5,
    description:
        'Classic vintage wooden chair with intricate carvings and a polished finish, ideal for cozy corners.',
  ),

  HomeItemModel(
    image: AppImages.teal_couch,
    name: 'Premium Wooden legs Couch',
    category: 'Bedroom',
    price: 600,
    rating: 4.4,
    description:
        'Stylish dressing table with a large mirror, multiple drawers, and a smooth finish for a luxurious feel.',
  ),
  HomeItemModel(
    image: AppImages.chair_set,
    name: 'Antique Couch',
    category: 'Living Room',
    price: 950,
    rating: 4.9,
    description:
        'Exquisite antique couch with plush cushions and ornate wooden details, perfect for classic interiors.',
  ),
  HomeItemModel(
    image: AppImages.chair3,
    name: 'Wooden Table',
    category: 'Dining',
    price: 450,
    rating: 4.6,
    description:
        'Elegant wooden dining table made from high-quality oak, offering both style and durability.',
  ),
];
