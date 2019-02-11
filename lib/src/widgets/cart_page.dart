import 'package:bloc_example/src/bloc/cart_provider.dart';
import 'package:bloc_example/src/model/cart.dart';
import 'package:bloc_example/src/model/cart_item.dart';
import 'package:bloc_example/src/utils/is_dark.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const routeName = "/cart";

  CartPage();

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your cart')),
      body: StreamBuilder<List<CartItem>>(
        stream: cart.items,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data.isEmpty) {
            return Center(
              child: Text('Empty', style: Theme.of(context).textTheme.display1),
            );
          }
          return ListView(
              children:
                  snapshot.data.map((item) => ItemTile(item: item)).toList());
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final CartItem item;

  const ItemTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: isDark(item.product.color) ? Colors.white : Colors.black);

    return Container(
      color: item.product.color,
      child: ListTile(
        title: Text(item.product.name, style: textStyle),
        trailing: CircleAvatar(
          backgroundColor: const Color(0x33ffffff),
          child: Text(
            item.count.toString(),
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
