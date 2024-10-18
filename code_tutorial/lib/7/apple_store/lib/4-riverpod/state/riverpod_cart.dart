import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = NotifierProvider<RiverpodCart, List<Product>>(() {
  return RiverpodCart();
});

class RiverpodCart extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void onProductPressed(Product product) {
    if (state.contains(product)) {
      // state.remove(product);
      state = state.where((element) => element != product).toList();
    } else {
      // state.add(product);
      state = [...state, product];
    }
  }
}
