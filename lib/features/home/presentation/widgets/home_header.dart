import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/widgets/neumorphic_box.dart';
import 'package:flutter/material.dart';

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
                  child: const NeumorphicBox(
                    borderRadius: 12,
                    depth: 6,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.menu_rounded, size: 22),
                    ),
                  ),
                ),
              ),

              Text(
                "HOME",
                style: AppTextTheme.logoStyle(
                  weight: FontWeight.w800,
                  letterSpacing: 2.0,
                ).copyWith(fontSize: 20),
              ),

              const NeumorphicBox(
                borderRadius: 12,
                depth: 6,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.notifications_none_rounded, size: 22),
                ),
              ),
            ],
          ),
          24.heightBox,

          const NeumorphicBox(
            borderRadius: 15,
            depth: 6,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search furniture...",
                hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
