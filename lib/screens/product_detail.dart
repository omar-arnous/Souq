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
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: Image(
                image: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
