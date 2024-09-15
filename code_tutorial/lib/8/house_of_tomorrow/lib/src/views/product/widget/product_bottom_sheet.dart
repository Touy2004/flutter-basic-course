import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/button/button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/counter_button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/res/layout.dart';
import 'package:code_tutoorial/utils/helper/intl_helper.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({
    super.key,
    required this.count,
    required this.product,
    required this.onCountChanged,
    required this.onAddToCartPressed,
  });

  final int count;
  final Product product;
  final void Function(int count) onCountChanged;
  final void Function() onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      isRoundAll: context.layout(false, desktop: true),
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          Row(
            children: [
              Text(
                S.current.quantity,
                style: context.typo.headline3,
              ),
              const Spacer(),

              /// CounterButton
              CounterButton(
                count: count,
                onChanged: onCountChanged,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                S.current.totalPrice,
                style: context.typo.headline3,
              ),
              const Spacer(),

              /// 금액
              Text(
                IntlHelper.currency(
                  symbol: product.priceUnit,
                  number: product.price * count,
                ),
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// 카트에 담기
          Button(
            width: double.infinity,
            size: ButtonSize.large,
            text: S.current.addToCart,
            onPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}
