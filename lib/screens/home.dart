import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/providers/product_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Container(
      margin: const EdgeInsets.all(20),
      child: FutureBuilder(
        future: ref.read(productProvider.notifier).getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff1DE9B6),
              ),
            );
          }
          return Column(
            children: [
              Text(
                'Products',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, i) => Text(products[i].title),
              ),
            ],
          );
        },
      ),
    );
  }
}
