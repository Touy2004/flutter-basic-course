import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/cart_item.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/cart_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/product/widget/product_bottom_sheet.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/product/widget/product_color_preview.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/product/widget/product_desc.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/cart_button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/color_picker.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/pop_button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/toast/toast.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/view/product/widget/product_layout.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.product});

  final Product product;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int count = 1;
  int colorIndex = 0;

  void onCountChanged(int newCount) {
    setState(() {
      count = newCount;
    });
  }

  void onColorIndexChanged(int newColorIndex) {
    setState(() {
      colorIndex = newColorIndex;
    });
  }

  void onAddToCartPressed() {
    final CartService cartService = context.read();
    final CartItem newCartItem = CartItem(
        product: widget.product,
        colorIndex: colorIndex,
        count: count,
        isSelected: true);

    cartService.add(newCartItem);
    Toast.show(S.current.productAdded(widget.product.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.product),
          leading: const PopButton(),
          titleSpacing: 0,
          actions: const [
            CartButton(),
          ],
        ),
        body: ProductLayout(
          productBottomSheet: ProductBottomSheet(
              count: count,
              product: widget.product,
              onCountChanged: onCountChanged,
              onAddToCartPressed: onAddToCartPressed),
          productInfo: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Wrap(
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: [
                ProductColorPreview(
                  colorIndex: colorIndex,
                  product: widget.product,
                ),
                ColorPicker(
                  colorIndex: colorIndex,
                  onColorSelected: onColorIndexChanged,
                  colorList: widget.product.productColorList.map((e) {
                    return e.color;
                  }).toList(),
                ),
                ProductDesc(product: widget.product)
              ],
            ),
          ),
        ));
  }
}
