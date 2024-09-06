import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  final String icon;
  final String title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            /// Start Icon
            AssetIcon(
              icon,
            ),
            const SizedBox(width: 8),

            /// Title
            Expanded(
              child: Text(
                title,
                style: context.typo.headline5,
              ),
            ),

            /// Subtitle
            Text(
              subtitle,
              style: context.typo.subtitle1.copyWith(
                color: context.color.primary,
              ),
            ),
            const SizedBox(width: 8),

            /// End Icon
            const AssetIcon('chevron-right'),
          ],
        ),
      ),
    );
  }
}
