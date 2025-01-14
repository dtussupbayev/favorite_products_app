import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_products_app/data/models/product.dart';
import 'package:favorite_products_app/data/repositories/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _repository;

  ProductsBloc(this._repository) : super(const ProductsState()) {
    on<LoadProductsEvent>((event, emit) {
      final products = _repository.getAllProducts();
      emit(state.copyWith(status: ProductsStatus.loaded, products: products));
    });

    on<ToggleFavoriteEvent>((event, emit) async {
      final updatedProduct =
          event.product.copyWith(isFavorite: !event.product.isFavorite);
      await _repository.updateProduct(updatedProduct);
      final products = _repository.getAllProducts();
      emit(state.copyWith(products: products));
    });

    on<FilterFavoritesEvent>((event, emit) {
      final favorites =
          _repository.getAllProducts().where((p) => p.isFavorite).toList();
      emit(state.copyWith(status: ProductsStatus.loaded, products: favorites));
    });
  }
}
