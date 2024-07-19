import 'package:flutter/material.dart';

import '../../domain/models/product_model.dart';


class ProductListItem extends StatelessWidget {
  final ProductModel product;

  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.thumbnail, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
