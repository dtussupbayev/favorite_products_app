part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends ProductsEvent {}

class ToggleFavoriteEvent extends ProductsEvent {
  final Product product;

  ToggleFavoriteEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class FilterFavoritesEvent extends ProductsEvent {}