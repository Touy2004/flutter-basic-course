import 'package:code_tutoorial/7/apple_store/lib/5-cubit/state/cart_cubit.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: cartCubit.state.contains(product),
            onPressed: cartCubit.onProductPressed,
          );
        },
      ),
    );
  }
}
