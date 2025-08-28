
import 'package:antiques_furniture/core/utils/app_images.dart';

class ProductModel {
  final String name;
  final String type;
  final double price;
  final double rating;
  final String image;

  ProductModel({
    required this.name,
    required this.type,
    required this.price,
    required this.rating,
    required this.image,
  });
}




const String dummyImage = AppImages.grey_couch;


final Map<String, List<ProductModel>> productsByCategory = {
  "Sofa": [
    ProductModel(name: "Modern Sofa", type: "Fabric", price: 199.99, rating: 4.5, image: AppImages.home_couch),
    ProductModel(name: "Leather Sofa", type: "Leather", price: 299.99, rating: 4.7, image: AppImages.mustard_couch),
    ProductModel(name: "Classic Grey Sofa", type: "Fabric", price: 249.99, rating: 4.4, image: AppImages.grey_couch),
    ProductModel(name: "Teal Luxury Sofa", type: "Velvet", price: 279.99, rating: 4.6, image: AppImages.teal_couch),
  ],

  "Bed": [
    ProductModel(name: "King Bed", type: "Wooden", price: 399.99, rating: 4.8, image: AppImages.bed1),
    ProductModel(name: "Queen Bed", type: "Wooden", price: 349.99, rating: 4.6, image: dummyImage),
    ProductModel(name: "Modern Wooden Bed", type: "Wooden", price: 299.99, rating: 4.5, image: dummyImage),
    ProductModel(name: "Luxury Bed", type: "Leather", price: 449.99, rating: 4.9, image: dummyImage),
  ],

  "Table": [
    ProductModel(name: "Round Table", type: "Wooden", price: 99.99, rating: 4.3, image: AppImages.table1),
    ProductModel(name: "Dining Table", type: "Wooden", price: 199.99, rating: 4.5, image: dummyImage),
    ProductModel(name: "Coffee Table", type: "Glass", price: 149.99, rating: 4.4, image: dummyImage),
    ProductModel(name: "Wooden Table", type: "Wooden", price: 129.99, rating: 4.2, image: dummyImage),
  ],

  "Chair": [
    ProductModel(name: "Classic Chair", type: "Wooden", price: 49.99, rating: 4.1, image: AppImages.chair1),
    ProductModel(name: "Stool Chair", type: "Metal", price: 59.99, rating: 4.0, image: AppImages.chair4),
    ProductModel(name: "Office Chair", type: "Leather", price: 89.99, rating: 4.3, image: dummyImage),
    ProductModel(name: "Dining Chair", type: "Wooden", price: 69.99, rating: 4.2, image: dummyImage),
  ],

  "Cupboard": [
    ProductModel(name: "Wooden Cupboard", type: "Wooden", price: 149.99, rating: 4.5, image: dummyImage),
    ProductModel(name: "Glass Door Cupboard", type: "Glass", price: 179.99, rating: 4.6, image: dummyImage),
    ProductModel(name: "Modern Cupboard", type: "Wooden", price: 199.99, rating: 4.4, image: dummyImage),
    ProductModel(name: "Metal Cupboard", type: "Metal", price: 129.99, rating: 4.3, image: dummyImage),
  ],

  "Dressing": [
    ProductModel(name: "Classic Dressing Table", type: "Wooden", price: 159.99, rating: 4.5, image: dummyImage),
    ProductModel(name: "Modern Dressing Table", type: "Glass", price: 189.99, rating: 4.6, image: dummyImage),
    ProductModel(name: "Vintage Dressing Table", type: "Wooden", price: 199.99, rating: 4.7, image: dummyImage),
    ProductModel(name: "Compact Dressing Table", type: "Metal", price: 139.99, rating: 4.4, image: dummyImage),
  ],
};
