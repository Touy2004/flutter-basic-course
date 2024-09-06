import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/product/widget/product_color_preview.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/color_picker.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/pop_button.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.product),
          leading: const PopButton(),
          titleSpacing: 0,
        ),
        body: Wrap(
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
          ],
        ));
  }
}
