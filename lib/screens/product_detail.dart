import 'package:flutter/material.dart';
import 'package:souq/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.image,
    required this.product,
  });

  final Product product;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SouQ'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Add to Cart'),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'SP ${product.price}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
