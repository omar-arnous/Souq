import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';

class CartNotifier extends StateNotifier<List<Cart>> {
  CartNotifier() : super([]);

  addToCart(Cart item) {
    return state = [
      ...state,
      item,
    ];
  }

  addOne(Cart item) {
    final itemIndex = state.indexOf(item);

    state[itemIndex].quantity + 1;
  }

  removeOne(Cart item) {
    final itemIndex = state.indexOf(item);

    if (state[itemIndex].quantity == 1) {
      state = state.where((e) => e != item).toList();
    }

    state[itemIndex].quantity - 1;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Cart>>(
  (ref) => CartNotifier(),
);
