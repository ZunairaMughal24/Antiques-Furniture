

import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/debouncer.dart';
import 'package:antiques_furniture/core/utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class SearchHeader extends HookWidget {
  const SearchHeader({
    super.key,
    this.onTap,
    this.autoFocus = false,
    this.color,
    this.enabled = true,
    this.onChanged,
    this.focusNode,
    this.hintText = 'Search Item',
    this.controller,
  });

  final VoidCallback? onTap;
  final bool autoFocus;
  final Color? color;
  final FocusNode? focusNode;
  final bool enabled;
  final void Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final debouncer = useMemoized(() => Debouncer(milliseconds: 500));
    final defaultController = useTextEditingController();
    final effectiveController = controller ?? defaultController;
    return GestureDetector(
      onTap: () {
        if (!enabled && onTap != null) {
          onTap!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        ignoring: !enabled,
        child: CupertinoSearchTextField(
          controller: effectiveController,
          padding: EdgeInsets.symmetric(vertical: 18),
          onChanged:
              onChanged ??
              (value) {
                if (value.length == 1) return;
                debouncer.run(() {
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                });
              },
          focusNode: focusNode,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: context.adaptive38),
            borderRadius: BorderRadius.circular(12),
            color: AppColors.blackColor
          ),
          autofocus: autoFocus,
          placeholder: hintText ?? 'Search item...',
          itemSize: 23,
          itemColor: AppColors.white,
          prefixInsets: const EdgeInsets.only(left: 20, right: 12),
          style: TextStyle(
            color: context.adaptive,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
