import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetIcon(
          'star',
          color: context.color.tertiary,
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          rating,
          style: context.typo.body1.copyWith(
            fontWeight: context.typo.light,
            color: context.color.subtext,
          ),
        ),
      ],
    );
  }
}
