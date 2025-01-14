import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/product.dart';
import 'data/repositories/product_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());

  final box = await Hive.openBox<Product>('products');

  getIt.registerSingleton<ProductRepository>(ProductRepository(box));
}
