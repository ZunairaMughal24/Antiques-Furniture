import 'package:flutter/material.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/models/banner_model.dart';

class PromotionalBannerSlider extends StatefulWidget {
  final List<BannerModel> banners;

  const PromotionalBannerSlider({super.key, required this.banners});

  @override
  State<PromotionalBannerSlider> createState() =>
      _PromotionalBannerSliderState();
}

class _PromotionalBannerSliderState extends State<PromotionalBannerSlider> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double bannerWidth = 330;
    const double bannerHeight = 170;
    final double textWidth = bannerWidth * 0.55;

    return SizedBox(
      height: bannerHeight,
      width: bannerWidth,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.asset(
                        banner.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      Positioned(
                        left: 12,
                        top: 35,
                        child: SizedBox(
                          width: textWidth,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                banner.heading,
                                style: AppTextTheme.bodySmall(
                                  weight: FontWeight.bold,
                                  lineHeight: 1.3,
                                  color: AppColors.pureBlack,
                                ).copyWith(fontSize: 12),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              4.heightBox,
                              Text(
                                banner.subheading,
                                style: AppTextTheme.caption(
                                  lineHeight: 1.3,
                                  color: AppColors.pureBlack,
                                ).copyWith(fontSize: 9),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              8.heightBox,
                              Container(
                                height: 16,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: AppColors.darkGrey),
                                ),
                                child: Text(
                                  "shop now",
                                  style: AppTextTheme.caption().copyWith(
                                    fontSize: 11,
                                  ),
                                  textAlign: TextAlign.center,
                                ).centered(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.banners.length, (index) {
                final bool isActive = index == currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 3,
                  width: isActive ? 40 : 5,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.white : AppColors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
