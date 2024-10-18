import 'dart:developer';

import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:flutter/material.dart';

class ProviderCart with ChangeNotifier {
  List<Product> cartProductList = [];

  void onProductPressed(Product product) {
    if (cartProductList.contains(product)) {
      log(
        cartProductList.map((e) => e.name).toString(),
      );
      log(product.name);
      // cartProductList.remove(product);
      cartProductList = cartProductList.where((cartProduct) {
        return cartProduct != product;
      }).toList();
    } else {
      // cartProductList.add(product);
      cartProductList = [...cartProductList, product];
    }
    notifyListeners();
  }
}
