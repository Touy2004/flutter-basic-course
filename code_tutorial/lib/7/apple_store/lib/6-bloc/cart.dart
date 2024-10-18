import 'package:code_tutoorial/7/apple_store/lib/6-bloc/state/cart_bloc.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> cartProductList = context.watch<CartBloc>().state;

    return Scaffold(
      body: cartProductList.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                Product product = cartProductList[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: (product) {
                    context.read<CartBloc>().add(OnProductPressed(product));
                  },
                );
              },
            ),
    );
  }
}
