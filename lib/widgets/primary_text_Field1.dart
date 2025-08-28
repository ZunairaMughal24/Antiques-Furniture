

import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/debouncer.dart';
import 'package:antiques_furniture/core/utils/extentions.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antiques_furniture/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    this.title,
    this.validator,
    this.obscureText = false,
    this.focusNode,
    this.nextNode,
    this.onSubmitAction,
    this.keyboardType,
    this.disabled = false,
    this.initialText,
    this.helperText,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.minLines = 1,
    this.maxLines = 1,
    this.border,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.onTap,
    this.titlePaddingLeft = 12,
    this.spacingBetweenTitleAndField = 4,
    this.filled = true,
    this.autoFocus = false,
    this.contentPadding,
    this.onChanged,
    this.fillColor,
    this.borderRadius,
    this.isRequired = false,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textColor,
    this.hintTextColor,
  });

  final TextEditingController controller;
  final String? title;
  final String? Function(String?)? validator;
  final bool obscureText;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final VoidCallback? onSubmitAction;
  final TextInputType? keyboardType;
  final bool disabled;
  final String? initialText;
  final String? helperText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final InputBorder? border;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final double titlePaddingLeft;
  final double spacingBetweenTitleAndField;
  final void Function(String)? onChanged;
  final bool filled;
  final bool autoFocus;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final double? borderRadius;
  final bool isRequired;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final Color? textColor;
  final Color? hintTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Row(
            children: [
              Text(
                title!,
                style: AppTextTheme.bodySmall(
                  color: AppColors.white,
                  weight: FontWeight.w600,
                ),
              ),
              if (isRequired == true) ...[
                4.widthBox,
                Text(
                  '*',
                  style: AppTextTheme.bodySmall(color: AppColors.errorRed),
                ),
              ],
            ],
          ).pOnly(left: titlePaddingLeft),
          spacingBetweenTitleAndField.heightBox,
        ],
        TextFormField(
          style: AppTextTheme.bodyMedium(color: textColor ?? AppColors.white),
          autofocus: autoFocus,
          readOnly: disabled || onTap != null,
          onTap: onTap == null ? null : () => onTap!(),
          inputFormatters: inputFormatters,
          minLines: minLines,
          maxLines: maxLines,
          initialValue: initialText,
          keyboardType: keyboardType,
          focusNode: focusNode,
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          textAlign: textAlign,
          onChanged: onChanged,
          onFieldSubmitted: (_) {
            if (nextNode != null) {
              FocusScope.of(context).requestFocus(nextNode);
            }
            if (onSubmitAction != null) {
              onSubmitAction!();
            }
          },
          textAlignVertical: TextAlignVertical.center,
          textInputAction:
              textInputAction ??
              (nextNode == null ? TextInputAction.done : TextInputAction.next),
          decoration: InputDecoration(
            isDense: true,
            filled: filled,
            fillColor: fillColor ?? AppColors.white,
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            border:
                border ??
                const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white),
                ),
            enabledBorder:
                border ??
                const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white),
                ),
            focusedBorder:
                border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: context.primaryColor,
                    width: 1.5,
                  ),
                ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.errorRed,
                width: 1.5,
              ), 
            ),
            disabledBorder:
                border ??
                const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white),
                ),
            hintText: hintText,

            hintStyle: AppTextTheme.bodyMedium().copyWith(
              color: hintTextColor ?? context.adaptive87,
            ),
            errorStyle: TextStyle(color: AppColors.errorRed),
            helperText: helperText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIconConstraints: prefixIconConstraints,
          ),
        ),
      ],
    );
  }
}
