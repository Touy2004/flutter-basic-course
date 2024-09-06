import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  final String icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/9/icons/$icon.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? context.color.text,
        BlendMode.srcIn,
      ),
    );
  }
}
