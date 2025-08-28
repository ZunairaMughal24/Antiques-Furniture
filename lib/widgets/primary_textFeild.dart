import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.focusNode,
    this.nextNode,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.onSubmitAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.textInputAction,
    this.minLines = 1,
    this.maxLines = 1,
    this.border,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.onTap,
    this.filled = true,
    this.autoFocus = false,
    this.contentPadding,
    this.fillColor,
    this.borderRadius,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textColor,
    this.hintTextColor,
    this.isRequired = false,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final VoidCallback? onSubmitAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final InputBorder? border;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool filled;
  final bool autoFocus;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final double? borderRadius;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final Color? textColor;
  final Color? hintTextColor;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: AppTextTheme.bodyMedium(color: textColor ?? AppColors.white),
          autofocus: autoFocus,
          readOnly: !enabled || onTap != null,
          onTap: onTap,
          inputFormatters: inputFormatters,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          focusNode: focusNode,
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          textAlign: textAlign,
          onFieldSubmitted: (_) {
            if (nextNode != null) {
              FocusScope.of(context).requestFocus(nextNode);
            }
            if (onSubmitAction != null) onSubmitAction!();
          },
          textInputAction:
              textInputAction ??
              (nextNode == null ? TextInputAction.done : TextInputAction.next),
          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            isDense: true,
            filled: filled,
            fillColor: fillColor ?? AppColors.white,
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

            border:
                border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 14),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),

            enabledBorder:
                border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 14),
                  borderSide: const BorderSide(color: AppColors.lightGrey),
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: BorderSide(color: AppColors.buttonColor, width: 1.5),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: const BorderSide(
                color: AppColors.errorRed,
                width: 1.5,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
              borderSide: const BorderSide(
                color: AppColors.errorRed,
                width: 1.5,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            labelStyle: AppTextTheme.bodyMedium().copyWith(
              color: hintTextColor ?? AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),
            hintStyle: AppTextTheme.bodyMedium().copyWith(
              color: hintTextColor ?? AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),

            errorStyle: AppTextTheme.bodySmall(color: AppColors.errorRed),
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.primaryColor,

            suffixIcon: suffixIcon != null
                ? GestureDetector(onTap: onSuffixTap, child: suffixIcon)
                : null,
            suffixIconColor: AppColors.lightGrey,
            suffixIconConstraints: suffixIconConstraints,
            prefixIconConstraints: prefixIconConstraints,
          ),
        ),
      ],
    );
  }
}
