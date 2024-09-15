import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/cart_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/button/button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/counter_badge.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/utils/route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    int count = context.watch<CartService>().cartItemList.length;
    return CounterBadge(
      label: "$count",
      isShow: count > 0,
      child: Button(
        icon: 'basket',
        type: ButtonType.flat,
        onPressed: () {
          Navigator.pushNamed(context, RoutePath.cart);
        },
      ),
    );
  }
}
