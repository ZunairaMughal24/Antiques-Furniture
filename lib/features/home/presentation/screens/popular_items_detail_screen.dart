import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/home/domain/models/home_model.dart';
import 'package:antiques_furniture/widgets/primary_appbar.dart';
import 'package:antiques_furniture/widgets/primary_button1.dart';
import 'package:antiques_furniture/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailScreen extends HookWidget {
  final HomeItemModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final quantity = useState<int>(1);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: product.name,

        showSearchButton: false,
        showNotificationButton: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight * 0.40,
              width: double.infinity,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),

            Container(
              height: screenHeight * 0.80,

              margin: EdgeInsets.only(top: screenHeight * 0.38),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppTextTheme.h3(weight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: AppTextTheme.h4(
                          color: AppColors.primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  8.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            product.rating.toStringAsFixed(1),
                            style: AppTextTheme.bodyMedium(
                              weight: FontWeight.w500,
                              color: AppColors.lightGrey,
                            ),
                          ),
                          6.widthBox,
                          RatingBarIndicator(
                            rating: product.rating,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 252, 194, 23),
                            ),
                            itemCount: 5,
                            itemSize: 18.0,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Quantity",
                            style: AppTextTheme.bodySmall(
                              color: AppColors.lightGrey,
                              weight: FontWeight.w500,
                            ).copyWith(fontSize: 15),
                          ),
                          8.widthBox,
                          QuantitySelector(
                            quantity: quantity.value,
                            onIncrease: () => quantity.value++,
                            onDecrease: () {
                              if (quantity.value > 1) {
                                quantity.value--;
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  16.heightBox,

                  Text(
                    product.description,
                    style: AppTextTheme.bodyMedium(color: AppColors.lightGrey),
                  ),

                  30.heightBox,

                  PrimaryButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.white,
                        ),
                        8.widthBox,
                        Text(
                          'Add to Cart',
                          style: AppTextTheme.bodyMedium(
                            color: AppColors.white,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ).p16(),
            ),
          ],
        ),
      ),
    );
  }
}
