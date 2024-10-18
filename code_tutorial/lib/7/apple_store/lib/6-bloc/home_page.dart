import 'package:code_tutoorial/7/apple_store/lib/6-bloc/cart.dart';
import 'package:code_tutoorial/7/apple_store/lib/6-bloc/state/badge_bloc.dart';
import 'package:code_tutoorial/7/apple_store/lib/6-bloc/state/cart_bloc.dart';
import 'package:code_tutoorial/7/apple_store/lib/6-bloc/store.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => BadgeBloc(cartBloc: context.read()),
        ),
      ],
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
        bottomNavigationBar: BlocBuilder<BadgeBloc, int>(
          builder: (context, total) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: "$total",
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
