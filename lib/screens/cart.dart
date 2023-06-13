import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/providers/cart_provider.dart';
import 'package:souq/widgets/cart_item.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    if (cart.isEmpty) {
      return Center(
        child: Text(
          'You cart is Empty',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, i) => CartItem(
        cart[i],
      ),
    );
  }
}
