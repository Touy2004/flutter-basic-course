import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
    this.padding,
    this.isRoundAll,
  });

  final Widget child;
  final EdgeInsets? padding;
  final bool? isRoundAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: isRoundAll ?? false
            ? BorderRadius.circular(24)
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
        boxShadow: context.deco.shadow,
      ),
      padding: padding ??
          const EdgeInsets.only(
            top: 32,
            bottom: 16,
          ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
