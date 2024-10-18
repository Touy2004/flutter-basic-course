import 'package:code_tutoorial/7/apple_store/lib/common/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  /// 상품 클릭
  void onProductPressed(Product product) {
    if (state.contains(product)) {
      // state.remove(product);
      // emit(state);
      emit(state.where((element) => element != product).toList());
    } else {
      // state.add(product);
      // emit(state);
      emit([...state, product]);
    }
  }
}
