import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/product_tile.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.cartProductList,
    required this.onPressed,
  });

  final List<Product> cartProductList;

  /// 클릭 이벤트
  final void Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cartProductList.isEmpty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                Product product = cartProductList[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: onPressed,
                );
              },
            ),
    );
  }
}
