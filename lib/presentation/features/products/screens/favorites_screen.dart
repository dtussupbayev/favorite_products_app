import 'package:favorite_products_app/presentation/features/products/bloc/products_bloc.dart';
import 'package:favorite_products_app/presentation/features/products/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status == ProductsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ProductsStatus.loaded) {
            final favorites =
                state.products.where((product) => product.isFavorite).toList();
            return ProductList(products: favorites);
          }
          return const SizedBox();
        },
      ),
    );
  }
}