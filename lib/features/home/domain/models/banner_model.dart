import 'package:antiques_furniture/core/utils/app_images.dart';

class BannerModel {
  final String image;
  final String heading;
  final String subheading;

  BannerModel({
    required this.image,
    required this.heading,
    required this.subheading,
  });
}

final List<BannerModel> banners = [
  BannerModel(
    image: AppImages.home_couch,
    heading: "FURNISH\nYOUR DREAMS",
    subheading:
        "with timeless, elegant, and durable pieces for inspired living spaces.",
  ),
  BannerModel(
    image: AppImages.home_couch1,
    heading: "Comfort & Style Combined in Every Sofa We Offer",
    subheading:
        "Find your perfect sofa today that matches your lifestyle and elevates your home décor",
  ),
  BannerModel(
    image: AppImages.sleek_beigh_couch,
    heading: "Elegance Redefined with Our Exclusive Chair Collections",
    subheading:
        "Experience luxury and craftsmanship with chairs designed for beauty and durability",
  ),
];
