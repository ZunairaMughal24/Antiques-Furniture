import 'package:antiques_furniture/core/const/dimentions.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/models/banner_model.dart';
import 'package:antiques_furniture/features/home/domain/models/home_model.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/category_chips.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_header.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_grid_popular_items.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/home_widget.dart';
import 'package:antiques_furniture/features/home/presentation/widgets/new_collection_row.dart';
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
      drawer: const Drawer(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),

              24.heightBox,

              PromotionalBannerSlider(banners: banners).px12(),

              20.heightBox,

              const SectionHeader(title: "Categories").px16(),
              8.heightBox,
              const CategoryFilterChips(),

              0.heightBox,

              const SectionHeader(
                title: "Collections",
                actionText: "See All",
              ).px16(),
              12.heightBox,
              NewCollectionRow(),

              24.heightBox,

              const SectionHeader(
                title: "Popular Items",
                actionText: "Show more",
              ).px16(),
              12.heightBox,
              SizedBox(
                height: dimensions.height * 1.05,
                child: HomeGridNoScroll(items: homeItems),
              ).px12(),

              100.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
