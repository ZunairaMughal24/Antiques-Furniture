import 'package:flutter/material.dart';

class OnboardingSlideEntity {
  final String tag;
  final String title;
  final String description;
  final IconData icon;
  final String image;

  const OnboardingSlideEntity({
    required this.tag,
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });
}
