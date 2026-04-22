import 'package:flutter/material.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/entities/banner_entity.dart';
import 'package:antiques_furniture/widgets/app_container.dart';

class PromotionalBannerSlider extends StatefulWidget {
  final List<BannerEntity> banners;

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
    const double bannerHeight = 220;

    return SizedBox(
      height: bannerHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            clipBehavior: Clip.none,
            itemCount: widget.banners.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return AppContainer(
                borderRadius: 24,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(banner.image, fit: BoxFit.cover),
                      ),

                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white.withOpacity(0.9),
                                Colors.white.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner.heading.toUpperCase(),
                              style: AppTextTheme.editorialStyle(
                                weight: FontWeight.w800,
                                lineHeight: 1.1,
                                color: Colors.black,
                              ).copyWith(fontSize: 22),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            6.heightBox,
                            SizedBox(
                              width: 170,
                              child: Text(
                                banner.subheading,
                                style: AppTextTheme.bodySmall(
                                  lineHeight: 1.2,
                                  color: Colors.black54,
                                ).copyWith(fontSize: 12),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: AppContainer(
                                borderRadius: 10,
                                color: AppColors.neumorphicBase,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.accentGold.withOpacity(
                                        0.5,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    "shop now",
                                    style: AppTextTheme.bodyMedium(
                                      weight: FontWeight.w500,
                                      color: AppColors.accentGold,
                                    ).copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.banners.length, (index) {
                final bool isActive = index == currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 4,
                  width: isActive ? 24 : 12,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.accentGold : Colors.black26,
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
