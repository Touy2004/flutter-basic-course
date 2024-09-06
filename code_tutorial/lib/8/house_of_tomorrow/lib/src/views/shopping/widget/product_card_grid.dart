import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/shopping/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductCardGrid extends StatelessWidget {
  const ProductCardGrid(
    this.productList, {
    super.key,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      //  context.layout(
      // 2,
      // tablet: 3,
      // desktop: 4,
      // ),
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return ProductCard(product: product);
      },
    );
  }
}