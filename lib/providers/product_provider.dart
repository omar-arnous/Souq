import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/services/api_client.dart';

import '../models/product.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super([]);

  Future<List<Product>> getProducts() async {
    print("Getting Products");
    final response = await ApiClient.getProducts();
    final products = response.data['products'];
    for (final product in products) {
      final productItem = Product.fromJson(product);
      state = [
        ...state,
        productItem,
      ];
    }
    return state;
  }
}

final productProvider = StateNotifierProvider<ProductsNotifier, List<Product>>(
    (ref) => ProductsNotifier());
