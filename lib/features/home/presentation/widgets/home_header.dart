import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/presentation/providers/home_provider.dart';
import 'package:antiques_furniture/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: const AppContainer(
                    borderRadius: 14,
                    borderColor: Colors.white70,
                    borderWidth: 1,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        size: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                "HOME",
                style: AppTextTheme.editorialStyle(
                  weight: FontWeight.w700,
                  letterSpacing: 1.2,
                ).copyWith(fontSize: 22),
              ),

              const AppContainer(
                borderRadius: 14,
                borderColor: Colors.white70,
                borderWidth: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    size: 24,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          28.heightBox,

          AppContainer(
            borderRadius: 30,
            color: Colors.white.withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            child: TextField(
              onChanged: (value) {
                context.read<HomeProvider>().searchProducts(value);
              },
              onSubmitted: (value) {
                context.read<HomeProvider>().searchProducts(value);
              },
              decoration: InputDecoration(
                hintText: "Find unique furniture...",
                hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Icon(Icons.search, color: Colors.amber, size: 24),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
