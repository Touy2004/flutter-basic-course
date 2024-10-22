import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/model/cart_item.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/util/helper/immutable_helper.dart';
import 'package:flutter/material.dart';

class CartService with ChangeNotifier {
  /// 상품 목록
  List<CartItem> cartItemList = const [];

  /// 선택된 상품 목록
  List<CartItem> get selectedCartItemList {
    return cartItemList.where((cartItem) => cartItem.isSelected).toImmutable();
  }

  /// 상품 추가
  void add(CartItem newCartItem) {
    cartItemList = [...cartItemList, newCartItem].toImmutable();
    notifyListeners();
  }

  /// 상품 수정
  void update(int selectedIndex, CartItem newCartItem) {
    cartItemList = cartItemList.asMap().entries.map((entry) {
      return entry.key == selectedIndex ? newCartItem : entry.value;
    }).toImmutable();
    notifyListeners();
  }

  /// 상품 목록 삭제
  void delete(List<CartItem> deleteList) {
    cartItemList = cartItemList.where((cartItem) {
      return !deleteList.contains(cartItem);
    }).toImmutable();
    notifyListeners();
  }
}
