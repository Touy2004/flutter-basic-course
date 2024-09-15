import 'dart:convert';
import 'dart:developer';

import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/shopping/widget/product_card.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/shopping/widget/product_card_grid.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/views/shopping/widget/product_empty.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/button/button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/cart_button.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/hide_keyboard.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/input_field.dart';
import 'package:code_tutoorial/utils/helper/network_helper.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

@override
class _ShoppingViewState extends State<ShoppingView> {
  List<Product> productList = [];
  final TextEditingController textContoller = TextEditingController();
  String get keyword => textContoller.text.trim();

  Future<void> searchProductList() async {
    try {
      final res = await NetworkHelper.dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

      // Ensure response data is a list before mapping it to Product
      final List<dynamic> jsonData = jsonDecode(res.data);

      setState(() {
        productList = jsonData.map<Product>((json) {
          return Product.fromJson(json);
        }).where((product) {
          if (keyword.isEmpty) {
            return true;
          }
          return "${product.name}${product.brand}"
              .toLowerCase()
              .contains(keyword.toLowerCase());
        }).toList(); // Convert to List<Product>
      });

      print(res.data); // Debugging the raw data
    } catch (e, s) {
      log('Failed to searchProductList', error: e, stackTrace: s);
    }
  }

  @override
  void initState() {
    searchProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.shopping),
            actions: [
              Button(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const SettingBottomSheet();
                      });
                },
                icon: 'option',
                type: ButtonType.flat,
              ),
              const CartButton()
            ],
          ),
          // backgroundColor: context.color.surface,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InputField(
                        controller: textContoller,
                        onClear: searchProductList,
                        onSubmitted: (text) => searchProductList(),
                        hint: S.current.searchProduct,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Button(
                      onPressed: searchProductList,
                      icon: 'search',
                    ),
                  ],
                ),
              ),
              // if (productList.isNotEmpty)
              //   ProductCard(
              //     product: productList[0],
              //   )
              Expanded(
                  child: productList.isEmpty
                      ? const ProductEmpty()
                      : ProductCardGrid(productList)),
            ],
          )),
    );
  }
}
