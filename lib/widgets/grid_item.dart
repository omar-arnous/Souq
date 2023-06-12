import 'package:flutter/material.dart';

import '../models/product.dart';

class GridItem extends StatelessWidget {
  const GridItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                'http://192.168.1.109:4000${product.image}',
              ),
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
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
                'SP ${product.price}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
