import 'package:favorite_products_app/presentation/features/products/bloc/products_bloc.dart';
import 'package:favorite_products_app/presentation/features/products/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status == ProductsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ProductsStatus.loaded) {
            return ProductList(products: state.products);
          }
          return SizedBox();
        },
      ),
    );
  }
}
