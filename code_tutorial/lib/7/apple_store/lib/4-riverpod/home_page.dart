import 'package:code_tutoorial/7/apple_store/lib/4-riverpod/cart.dart';
import 'package:code_tutoorial/7/apple_store/lib/4-riverpod/state/riverpod_badge.dart';
import 'package:code_tutoorial/7/apple_store/lib/4-riverpod/store.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            /// Store
            Store(),

            /// Cart
            Cart(),
          ],
        ),
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: "${ref.watch(badgeProvider)}",
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
