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
    heading: "Furnish Your Dreams With Timeless and Elegant Furniture",
    subheading:
        "Discover unique pieces crafted for inspired living spaces and lasting comfort",
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
