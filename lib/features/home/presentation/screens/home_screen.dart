import 'package:antiques_furniture/core/const/dimentions.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/models/banner_model.dart';
import 'package:antiques_furniture/features/home/domain/models/home_model.dart';
import 'package:antiques_furniture/features/home/domain/models/new_collection_model.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_grid_popular_items.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_widget.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/new_collection_row.dart';

import 'package:antiques_furniture/widgets/primary_appbar.dart';
import 'package:antiques_furniture/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context);
    return Scaffold(
      appBar: PrimaryAppBar(title: "Home"),

      body: SingleChildScrollView(
        child: (Column(
          children: [
            6.heightBox,
            // PromotionalBanner(),
            PromotionalBannerSlider(banners: banners).px12(),

            6.heightBox,
            SectionHeader(title: "New Collections").px12(),
            6.heightBox,
            FurnitureImageRow(),
            6.heightBox,
            SectionHeader(
              title: "Popular Items",
              actionText: "Show more",
            ).px12(),
            6.heightBox,
            SizedBox(
              height: dimensions.height * 0.90 + dimensions.height * 0.04,
              child: HomeGridNoScroll(items: homeItems),
            ).px12(),
          ],
        )),
      ),
    );
  }
}
