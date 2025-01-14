import 'package:favorite_products_app/data/models/product.dart';
import 'package:favorite_products_app/presentation/features/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(
          product.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () =>
            context.read<ProductsBloc>().add(ToggleFavoriteEvent(product)),
      ),
    );
  }
}
