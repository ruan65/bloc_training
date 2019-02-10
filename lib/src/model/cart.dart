import 'dart:collection';
import 'dart:math';

import 'package:bloc_example/src/model/cart_item.dart';
import 'package:bloc_example/src/model/product.dart';

class Cart {
  final _items = <CartItem>[];

  Cart();

  Cart.clone(Cart oldCart) {
    _items.addAll(oldCart._items);
  }

  get itemCount => _items.fold(0, (sum, el) => sum + el.count);
  get items => UnmodifiableListView(_items);

  add(Product product, [int count = 1]) {
    _updateCount(product, count);
  }

  remove(Product product, [int count = 1]) {
    _updateCount(product, count);
  }

  @override
  String toString() => '$_items';

  _updateCount(Product product, int difference) {
    if(difference == 0) return;
    for(int i = 0; i < _items.length; i++) {
      final item = _items[i];
      if(product == item.product) {
        final newCount = item.count + difference;
        if(newCount <= 0) {
          _items.removeAt(i);
          return;
        }
        _items[i] = CartItem(newCount, item.product);
        return;
      }
    }
    if(difference < 0) return;
    _items.add(CartItem(max(difference, 0), product));
  }
}