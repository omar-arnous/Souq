import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/providers/cart_provider.dart';

import '../models/cart.dart';
import '../utils/utilities.dart';

class CartItem extends ConsumerWidget {
  const CartItem(this.cart, {super.key});
  final Cart cart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final util = Utilities();
    final amount = util.formatCurrency(cart.calcAmount());
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '$amount SP',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () =>
                      ref.read(cartProvider.notifier).removeOne(cart),
                  icon: const Icon(
                    Icons.remove,
                    color: Color(0xffF1F1F1),
                  ),
                ),
                Text(
                  '${cart.quantity}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(
                  onPressed: () => ref.read(cartProvider.notifier).addOne(cart),
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xffF1F1F1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
