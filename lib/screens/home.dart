import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:souq/models/product.dart';
import 'package:souq/providers/product_provider.dart';

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
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff1DE9B6),
              ),
            );
          }
          // return Column(
          //   children: [
          //     Text(
          //       'Products',
          //       style: Theme.of(context).textTheme.titleLarge,
          //     ),
          //     GridView.builder(
          //       itemCount: products.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         childAspectRatio: 3 / 2,
          //         crossAxisSpacing: 20,
          //         mainAxisExtent: 20,
          //       ),
          //       itemBuilder: (context, i) => Text(products[i].title),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
