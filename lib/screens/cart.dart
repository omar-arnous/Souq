import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/providers/cart_provider.dart';
import 'package:souq/widgets/cart_item.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final total = ref.read(cartProvider.notifier).calcTotal();

    if (cart.isEmpty) {
      return Center(
        child: Text(
          'You cart is Empty',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffE3E3E3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total: '),
              Text('$total SP'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, i) => CartItem(
              cart[i],
            ),
          ),
        ),
      ],
    );
  }
}
