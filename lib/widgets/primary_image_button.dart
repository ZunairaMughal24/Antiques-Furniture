
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PrimaryImageButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final String image;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;
  final Color? imageColor;
  final double imageHeight;
  final double imageWidth;

  const PrimaryImageButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.image,
    required this.buttonColor,
    required this.textColor,
    this.isLoading = false,
    this.imageColor,
    this.imageHeight = 24.0,
    this.imageWidth = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      onPressed: onPressed,
      child: (() {
        if (isLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: const SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.blackColor),
              ),
            ),
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: imageHeight,
              width: imageWidth,
              color: imageColor,
            ),
            10.widthBox,
            Text(
              buttonText,
              style: AppTextTheme.bodySmall(
                color: textColor,
                weight: FontWeight.w500,
              ),
            ),
          ],
        );
      })(),
    );
  }
}
