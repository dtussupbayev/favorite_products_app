part of 'products_bloc.dart';

enum ProductsStatus { loading, loaded, error }

class ProductsState extends Equatable {
  final ProductsStatus status;
  final List<Product> products;

  const ProductsState({
    this.status = ProductsStatus.loading,
    this.products = const [],
  });

  ProductsState copyWith({
    ProductsStatus? status,
    List<Product>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, products];
}