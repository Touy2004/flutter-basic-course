import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.current.cartIsEmpty,
        style: context.typo.headline4.copyWith(
          color: context.color.inactive,
          fontWeight: context.typo.light,
        ),
      ),
    );
  }
}
