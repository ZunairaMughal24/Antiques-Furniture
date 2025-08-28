
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/debouncer.dart';
import 'package:antiques_furniture/core/utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FocusNode? nextFocusNode;
  final TextCapitalization? textCapitalization;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Text? header;
  final Color backgroundColor;
  final bool hasBorder;
  final bool isFullBorder;
  final VoidCallback? onTap;
  final String? label;
  final bool isSecure;
  final bool readOnly;
  final int? hintMaxLines;
  final int? contentMaxLines;
  final double? headerPadding;
  final double borderRadius;
  final Color focusedBorderColor;
  final Color unfocusedBorderColor;
  final bool? isAutoFocus;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool showValidationBanner;
  final String? initialValue;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final TextStyle? errorStyle;
  final BoxConstraints? suffixConstraints;
  final BoxConstraints? prefixConstraints;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final EdgeInsets? scrollPadding;
  final void Function(String)? onFieldSubmitted;
  final bool isCounter;
  final void Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;
  // New parameter for text alignment
  final TextAlignVertical? textAlignVertical;

  const TextFormWidget({
    super.key,
    this.showValidationBanner = false,
    this.controller,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.nextFocusNode,
    this.textCapitalization,
    this.hint = "",
    this.onTap,
    this.isAutoFocus,
    this.hintStyle,
    this.textStyle,
    this.suffixIcon,
    this.header,
    this.backgroundColor = Colors.white,
    this.hasBorder = true,
    this.isFullBorder = true,
    this.label = "",
    this.isSecure = false,
    this.readOnly = false,
    this.hintMaxLines,
    this.headerPadding,
    this.focusedBorderColor = AppColors.blackColor,
    this.unfocusedBorderColor = AppColors.greyText,
    this.contentMaxLines,
    this.borderRadius = 10,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.inputFormatter,
    this.errorStyle,
    this.enabled = true,
    this.suffixConstraints,
    this.isDense = false,
    this.contentPadding,
    this.prefixIcon,
    this.prefixConstraints,
    this.scrollPadding,
    this.onFieldSubmitted,
    this.onSaved,
    this.isCounter = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.textAlignVertical, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        header ?? const SizedBox.shrink(),
        headerPadding != null ? SizedBox(height: headerPadding) : Container(),
        TextFormField(
          scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
          enabled: enabled,
          maxLines: contentMaxLines,
          controller: controller,
          initialValue: initialValue,
          autofocus: isAutoFocus ?? false,
          focusNode: focusNode,
          obscureText: isSecure,
          onTap: onTap,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          maxLength: maxLength,
          readOnly: readOnly,
          onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: inputFormatter,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          // Add textAlignVertical property
          textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
          onFieldSubmitted:
              onFieldSubmitted ??
              ((_) {
                if (nextFocusNode != null) {
                  if (FocusScope.of(context).canRequestFocus) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  }
                }
              }),
          decoration: InputDecoration(
            hintMaxLines: hintMaxLines,
            // Change alignLabelWithHint to false for better vertical centering
            alignLabelWithHint: false,
            isDense: isDense,
            labelStyle: TextStyle(color: context.adaptive87),
            // Updated contentPadding for better vertical centering
            contentPadding:
                contentPadding ??
                EdgeInsets.symmetric(
                  vertical: contentMaxLines != null && contentMaxLines! > 1
                      ? 20
                      : 16,
                  horizontal: 20,
                ),
            counter: isCounter ? null : const Offstage(),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixConstraints,
            suffixIconConstraints: suffixConstraints,
            hintText: hint,
            hintStyle: hintStyle ?? TextStyle(color: context.adaptive87),
            fillColor: backgroundColor,
            errorStyle: errorStyle,
            filled: true,
            focusedBorder: hasBorder
                ? (isFullBorder
                      ? textFiledCommonBorder(
                          borderColor: focusedBorderColor,
                          borderRadius: borderRadius,
                        )
                      : textFieldUnderlineBorder(
                          borderColor: focusedBorderColor,
                        ))
                : InputBorder.none,
            border: hasBorder
                ? (isFullBorder
                      ? textFiledCommonBorder(
                          borderColor: focusedBorderColor,
                          borderRadius: borderRadius,
                        )
                      : textFieldUnderlineBorder(
                          borderColor: focusedBorderColor,
                        ))
                : InputBorder.none,
            enabledBorder: hasBorder
                ? (isFullBorder
                      ? textFiledCommonBorder(
                          borderColor: unfocusedBorderColor,
                          borderRadius: borderRadius,
                        )
                      : textFieldUnderlineBorder(
                          borderColor: unfocusedBorderColor,
                        ))
                : InputBorder.none,
          ),
          style:
              textStyle ?? AppTextTheme.bodyMedium(color: context.adaptive87),
        ),
      ],
    );
  }
}

InputBorder textFiledCommonBorder({
  Color? borderColor,
  double borderRadius = 10,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
  );
}

InputBorder textFieldUnderlineBorder({Color? borderColor}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
  );
}
