import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/res/layout.dart';
import 'package:flutter/material.dart';

class ConstrainedScreen extends StatelessWidget {
  const ConstrainedScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: context.color.surface,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Breakpoints.desktop,
        ),
        child: child,
      ),
    );
  }
}
