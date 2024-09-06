import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.cartTotal,
    this.onTap,
  });

  final int currentIndex;

  final String cartTotal;

  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        /// Store
        const BottomNavigationBarItem(
          icon: Icon(Icons.storefront),
          label: 'Store',
        ),

        /// Cart
        BottomNavigationBarItem(
          /// Badge
          icon: badges.Badge(
            badgeContent: Text(
              cartTotal,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            child: const Icon(Icons.shopping_cart),
          ),
          label: 'Cart',
        ),
      ],
    );
  }
}
