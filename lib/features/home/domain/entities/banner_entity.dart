import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String image;
  final String heading;
  final String subheading;

  const BannerEntity({
    required this.image,
    required this.heading,
    required this.subheading,
  });

  @override
  List<Object?> get props => [image, heading, subheading];
}
