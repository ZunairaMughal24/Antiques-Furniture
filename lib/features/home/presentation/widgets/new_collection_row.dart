// import 'package:antiques_furniture/core/utils/padding_extention.dart';
// import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
// import 'package:flutter/material.dart';
// class FurnitureImageRow extends StatelessWidget {
// const FurnitureImageRow({super.key});
//  @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       physics: const BouncingScrollPhysics(),
//       child: Row(
//         children: [
//           _FurnitureImageContainer(imagePath: "assets/images/couch1.jpg"),
//           12.widthBox,
//           _FurnitureImageContainer(imagePath: "assets/images/couch2.jpg"),
//           12.widthBox,
//           _FurnitureImageContainer(imagePath: "assets/images/couch1.jpg"),
//           12.widthBox,
//           _FurnitureImageContainer(imagePath: "assets/images/couch2.jpg"),
//         ],
//       ).pOnly(left: 12, top: 4, bottom: 4),
//     );
//   }
// }
// class _FurnitureImageContainer extends StatelessWidget {
//   final String imagePath;
// const _FurnitureImageContainer({required this.imagePath});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 170,
//       width: 240,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Image.asset(imagePath, fit: BoxFit.cover),
//       ),
//     );
//   }
// }
import 'package:antiques_furniture/config/router.dart';
import 'package:flutter/material.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/models/new_collection_model.dart';
import 'package:antiques_furniture/features/home/presentation/screens/popular_items_detail_screen.dart';
import 'package:go_router/go_router.dart';

class FurnitureImageRow extends StatelessWidget {
  const FurnitureImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: newCollectionItems.map((item) {
          return Row(
            children: [
              _FurnitureImageContainer(
                product: item,
                onTap: () {
                  context.push(
                    AppRoutes.newColectionDetailScreenRoute,
                    extra: item,
                  );
                },
              ),
              12.widthBox,
            ],
          );
        }).toList(),
      ).pOnly(left: 12, top: 4, bottom: 4),
    );
  }
}

class _FurnitureImageContainer extends StatelessWidget {
  final NewCollectionModel product;
  final VoidCallback onTap;

  const _FurnitureImageContainer({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 170,
        width: 240,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(product.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
