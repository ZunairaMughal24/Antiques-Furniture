import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:antiques_furniture/features/home/domain/entities/banner_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/category_entity.dart';
import 'package:antiques_furniture/features/home/domain/entities/product_entity.dart';

abstract class HomeDataSource {
  Future<List<BannerEntity>> getBanners();
  Future<List<ProductEntity>> getTrendingProducts();
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getProductsByCategory(String categoryName);
  Future<List<ProductEntity>> searchProducts(String query);
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<BannerEntity>> getBanners() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const BannerEntity(
        image: AppImages.home_couch,
        heading: "FURNISH\nYOUR DREAMS",
        subheading:
            "with timeless, elegant, and durable pieces for inspired living spaces.",
      ),
      const BannerEntity(
        image: AppImages.home_couch1,
        heading: "Comfort & Style Combined in Every Sofa We Offer",
        subheading:
            "Find your perfect sofa today that matches your lifestyle and elevates your home décor",
      ),
      const BannerEntity(
        image: AppImages.sleek_beigh_couch,
        heading: "Elegance Redefined with Our Exclusive Chair Collections",
        subheading:
            "Experience luxury and craftsmanship with chairs designed for beauty and durability",
      ),
    ];
  }

  @override
  Future<List<ProductEntity>> getTrendingProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      const ProductEntity(
        id: '1',
        name: 'Luxury Couch',
        category: 'Sofa',
        image: AppImages.new_collection_couch1,
        price: 799,
        rating: 4.8,
        description:
            'A sleek and comfortable modern sofa made with premium fabric and sturdy wooden legs.',
      ),
      const ProductEntity(
        id: '2',
        name: 'Classic Sofa',
        category: 'Sofa',
        image: AppImages.new_collection_couch2,
        price: 650,
        rating: 4.7,
        description:
            'Elegant and timeless design with deep cushions and a durable frame.',
      ),
      const ProductEntity(
        id: '3',
        name: 'Modern Loveseat',
        category: 'Sofa',
        image: AppImages.sleek_beigh_couch,
        price: 500,
        rating: 4.5,
        description:
            'Compact loveseat with a stylish design, ideal for apartments and cozy living spaces.',
      ),
    ];
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const CategoryEntity(id: '1', name: 'Sofa', icon: AppImages.svg_sofa),
      const CategoryEntity(id: '2', name: 'Bed', icon: AppImages.svg_bed),
      const CategoryEntity(id: '3', name: 'Table', icon: AppImages.svg_table),
      const CategoryEntity(id: '4', name: 'Chair', icon: AppImages.svg_chair),
      const CategoryEntity(
        id: '5',
        name: 'Cupboard',
        icon: AppImages.svg_cupboard,
      ),
      const CategoryEntity(
        id: '6',
        name: 'Dressing',
        icon: AppImages.svg_dressing,
      ),
    ];
  }

  @override
  Future<List<ProductEntity>> getProductsByCategory(String categoryName) async {
    await Future.delayed(const Duration(milliseconds: 400));
    // Mock data based on category
    if (categoryName == 'Sofa') {
      return [
        const ProductEntity(
          id: '1',
          name: "Modern Sofa",
          category: "Sofa",
          price: 199,
          rating: 4.5,
          image: AppImages.home_couch,
          description: "Modern comfort.",
        ),
        const ProductEntity(
          id: '8',
          name: "Leather Sofa",
          category: "Sofa",
          price: 299,
          rating: 4.7,
          image: AppImages.mustard_couch,
          description: "Luxury leather.",
        ),
        const ProductEntity(
          id: '9',
          name: "Teal Luxury Sofa",
          category: "Sofa",
          price: 279,
          rating: 4.6,
          image: AppImages.teal_couch,
          description: "Velvet touch.",
        ),
      ];
    } else if (categoryName == 'Bed') {
      return [
        const ProductEntity(
          id: '10',
          name: "King Bed",
          category: "Bed",
          price: 399,
          rating: 4.8,
          image: AppImages.bed1,
          description: "King size comfort.",
        ),
      ];
    }

    return [];
  }

  @override
  Future<List<ProductEntity>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final allProducts = await getTrendingProducts();
    return allProducts
        .where(
          (p) =>
              p.name.toLowerCase().contains(query.toLowerCase()) ||
              p.category.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
