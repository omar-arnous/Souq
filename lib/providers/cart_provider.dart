import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';
import '../models/order.dart';
import '../services/api_client.dart';

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
    final currentItem = state[itemIndex];
    final modifiedItem = Cart(
      title: currentItem.title,
      price: currentItem.price,
      quantity: currentItem.quantity + 1,
    );
    final currentState = state.where((e) => e != item);

    state = [
      ...currentState,
      modifiedItem,
    ];
  }

  removeOne(Cart item) {
    final itemIndex = state.indexOf(item);

    if (state[itemIndex].quantity == 1) {
      state = state.where((e) => e != item).toList();
    } else {
      final currentItem = state[itemIndex];
      final modifiedItem = Cart(
        title: currentItem.title,
        price: currentItem.price,
        quantity: currentItem.quantity - 1,
      );
      final currentState = state.where((e) => e != item);

      state = [
        ...currentState,
        modifiedItem,
      ];
    }
  }

  int calcTotal() {
    int total = 0;
    for (final item in state) {
      total += item.calcAmount();
    }

    return total;
  }

  Future makeOrder(Order order) async {
    await ApiClient.makeOrder(order);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Cart>>(
  (ref) => CartNotifier(),
);
