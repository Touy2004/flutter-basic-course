import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/view/cart/cart_view.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/view/product/product_view.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/view/shopping/shopping_view.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/constrained_screen.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  static const String shopping = 'shopping';
  static const String product = 'product';
  static const String cart = 'cart';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.shopping:
        page = const ShoppingView();
        break;
      case RoutePath.product:
        Product product = settings.arguments as Product;
        page = ProductView(product: product);
        break;
      case RoutePath.cart:
        page = const CartView();
        break;
    }

    return MaterialPageRoute(
      builder: (context) => ConstrainedScreen(child: page),
    );
  }
}
