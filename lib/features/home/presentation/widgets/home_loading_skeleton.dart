import 'package:flutter/material.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/widgets/app_container.dart';

class HomeLoadingSkeleton extends StatefulWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  State<HomeLoadingSkeleton> createState() => _HomeLoadingSkeletonState();
}

class _HomeLoadingSkeletonState extends State<HomeLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 0.6).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 140),
                _skeletonBox(height: 200, width: double.infinity, margin: 16),
                const SizedBox(height: 30),
                _skeletonBox(height: 20, width: 150, margin: 16),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      4,
                      (index) =>
                          _skeletonBox(height: 80, width: 80, margin: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _skeletonBox(height: 20, width: 100, margin: 16),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    4,
                    (index) => _skeletonBox(
                      height: 200,
                      width: double.infinity,
                      margin: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _skeletonBox({
    required double height,
    required double width,
    required double margin,
  }) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
