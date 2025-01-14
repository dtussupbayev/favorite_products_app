import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double price;

  @HiveField(2)
  bool isFavorite;

  Product({required this.name, required this.price, this.isFavorite = false});

  Product copyWith({String? name, double? price, bool? isFavorite}) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
