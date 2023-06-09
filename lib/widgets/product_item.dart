import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:souq/utils/utilities.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/product.dart';
import '../utils/constants.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final util = Utilities();
    final NetworkImage image = NetworkImage('$kUrl${product.image}');
    final price = util.formatCurrency(int.parse(product.price));

    return Card(
      child: InkWell(
        onTap: () => context.go('/product-detail', extra: {
          "image": image,
          "product": product,
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: image,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'SP $price',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
