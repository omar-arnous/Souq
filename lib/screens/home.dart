import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/models/product.dart';
import 'package:souq/providers/product_provider.dart';
import 'package:souq/widgets/product_item.dart';

late Future<List<Product>> _value;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _value = ref.read(productProvider.notifier).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);

    return Container(
      margin: const EdgeInsets.all(20),
      child: FutureBuilder(
        future: _value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff1DE9B6),
              ),
            );
          }
          if (products.isEmpty) {
            return const Center(
              child: Text('No Products Available'),
            );
          }
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, i) => ProductItem(products[i]),
          );
        },
      ),
    );
  }
}
