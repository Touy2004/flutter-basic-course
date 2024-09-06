import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/res/layout.dart';
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
