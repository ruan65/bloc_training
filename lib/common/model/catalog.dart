import 'dart:ui' show Color;
import 'dart:collection';

import 'package:bloc_example/common/model/product.dart';

final Catalog catalog = fetchCatalogSync();

Catalog fetchCatalogSync() {
  return Catalog._sample();
}

class Catalog {
  static const List<Product> _sampleProducts = const <Product>[
    const Product(42, "Sweater", const Color(0xFF536DFE)),
    const Product(1024, "Socks", const Color(0xFFFFD500)),
    const Product(1337, "Shawl", const Color(0xFF1CE8B5)),
    const Product(123, "Jacket", const Color(0xFFFF6C00)),
    const Product(201805, "Hat", const Color(0xFF574DDD)),
    const Product(128, "Hoodie", const Color(0xFFABD0F2)),
    const Product(321, "Tuxedo", const Color(0xFF8DA0FC)),
    const Product(1003, "Shirt", const Color(0xFF1CE8B5)),

    const Product(4233, "Sunglasses", const Color(0xFF536DFE)),
    const Product(102455, "Mac Book Pro 15'", const Color(0xFFFFD500)),
    const Product(133741, "Apple Watch", const Color(0xFF1CE8B5)),
    const Product(12311, "Gillette Match", const Color(0xFFFF6C00)),
    const Product(201800, "Motorbike", const Color(0xFF574DDD)),
    const Product(128098, "Underpants Calvin Clein", const Color(0xFFABD0F2)),
    const Product(32121, "Cognac Napoleon", const Color(0xFF8DA0FC)),
    const Product(1000, "Car Tesla", const Color(0xFF1CE8B5)),
  ];

  final List<Product> _products;

  Catalog.empty() : _products = [];

  Catalog._sample() : _products = _sampleProducts;

  bool get isEmpty => _products.isEmpty;

  UnmodifiableListView<Product> get products => UnmodifiableListView<Product>(_products);
}