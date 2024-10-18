import 'package:code_tutoorial/7/apple_store/lib/5-cubit/cart.dart';
import 'package:code_tutoorial/7/apple_store/lib/5-cubit/state/badge_cubit.dart';
import 'package:code_tutoorial/7/apple_store/lib/5-cubit/state/cart_cubit.dart';
import 'package:code_tutoorial/7/apple_store/lib/5-cubit/store.dart';
import 'package:code_tutoorial/7/apple_store/lib/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => BadgeCubit(cartCubit: context.read()),
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
        bottomNavigationBar: BlocBuilder<BadgeCubit, int>(
          builder: (context, state) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: "$state",
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
