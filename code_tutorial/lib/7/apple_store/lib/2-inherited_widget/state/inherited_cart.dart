import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:flutter/material.dart';

class InheritedCart extends InheritedWidget {
  const InheritedCart({
    super.key,
    required super.child,
    required this.cartProductList,
    required this.onProductPressed,
  });

  final List<Product> cartProductList;

  final void Function(Product product) onProductPressed;

  @override
  bool updateShouldNotify(InheritedCart oldWidget) {
    print("${cartProductList.length} / ${oldWidget.cartProductList.length}");
    return cartProductList != oldWidget.cartProductList;
  }

  /// InheritedCart.of(context)
  static InheritedCart of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCart>()!;
  }
}

extension BuildContextExt on BuildContext {
  /// context.read<InheritedCart>()
  T read<T extends InheritedWidget>() {
    return dependOnInheritedWidgetOfExactType<T>()!;
  }
}
