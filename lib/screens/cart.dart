import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/providers/cart_provider.dart';

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
      itemBuilder: (context, i) => ListTile(
        title: Column(
          children: [
            Text(cart[i].title),
            Text('${cart[i].calcAmount()}'),
          ],
        ),
        trailing: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
            Text('${cart[i].quantity}'),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}