import 'package:bloc_example/src/bloc/cart_bloc.dart';
import 'package:bloc_example/src/bloc/cart_provider.dart';
import 'package:bloc_example/src/model/catalog.dart';
import 'package:bloc_example/src/widgets/cart_button.dart';
import 'package:bloc_example/src/widgets/cart_page.dart';
import 'package:bloc_example/src/widgets/product_square.dart';
import 'package:bloc_example/src/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Bloc icon',
        theme: appTheme,
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          CartPage.routeName: (context) => CartPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);

    final cartButton = getCartButton(context, cartBloc.itemCount);

    final smokeFreeButton = getSmokeFreeButton(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc!'),
        actions: <Widget>[cartButton, smokeFreeButton],
      ),
      body: Grid(),
    );
  }
}

Widget getCartButton(BuildContext context, Stream<int> itemCount) =>
    StreamBuilder<int>(
      stream: itemCount,
      initialData: 0,
      builder: (context, snapshot) => CartButton(
            itemCount: snapshot.data,
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
    );

Widget getSmokeFreeButton(BuildContext context) => IconButton(
      icon: Icon(Icons.smoke_free),
      onPressed: () {
        print('smoke free pressed....');
      },
    );

List<Widget> getProductListData(BuildContext context) =>
    catalog.products.map((product) {
      final cartBloc = CartProvider.of(context);
      return ProductSquare(
        product: product,
        onTap: () {
          print('I am $product');
          cartBloc.cartAddition.add(CartAddition(product));
        },
      );
    }).toList();

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: getProductListData(context),
    );
  }
}
