import 'package:hive/hive.dart';
import '../models/product.dart';

class ProductRepository {
  final Box<Product> _box;

  ProductRepository(this._box) {
    _initializeData();
  }

  void _initializeData() {
    if (_box.isEmpty) {
      final initialProducts = [
        Product(name: 'Product 1', price: 1.5),
        Product(name: 'Product 2', price: 0.9),
        Product(name: 'Product 3', price: 1.2),
        Product(name: 'Product 4', price: 2.5),
        Product(name: 'Product 5', price: 1.0),
        Product(name: 'Product 6', price: 2.1),
        Product(name: 'Product 7', price: 3.2),
        Product(name: 'Product 8', price: 0.8),
      ];

      for (var product in initialProducts) {
        _box.put(product.name, product);
      }
    }
  }

  List<Product> getAllProducts() {
    return _box.values.toList();
  }

  Future<void> addProduct(Product product) async {
    await _box.put(product.name, product);
  }

  Future<void> updateProduct(Product product) async {
    await _box.put(product.name, product);
  }
}
