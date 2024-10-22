import 'package:code_tutoorial/7/apple_store/lib/1-stateful_widgets/cart.dart';
import 'package:code_tutoorial/7/apple_store/lib/1-stateful_widgets/store.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/bottom_bar.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Product> cartProductList = [];

  void onProductPressed(Product product) {
    setState(() {
      if (cartProductList.contains(product)) {
        cartProductList.remove(product);
      } else {
        cartProductList.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          /// Store
          Store(
            cartProductList: cartProductList,
            onPressed: onProductPressed,
          ),

          /// Cart
          Cart(
            cartProductList: cartProductList,
            onPressed: onProductPressed,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: "${cartProductList.length}",
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
