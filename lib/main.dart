import 'package:bloc_example/common/model/catalog.dart';
import 'package:bloc_example/common/widgets/cart_button.dart';
import 'package:bloc_example/common/widgets/cart_page.dart';
import 'package:bloc_example/common/widgets/product_square.dart';
import 'package:bloc_example/common/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc icon',
      theme: appTheme,
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        CartPage.routeName: (context) => CartPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc n'),
        actions: <Widget>[
          CartButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
        ],
      ),
      body: Grid(),
    );
  }
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: getProductListData(),
    );
  }
}

List<Widget> getProductListData() => catalog.products.map((product) {
      return ProductSquare(
        product: product,
        onTap: () {
          print('I am $product');
        },
      );
    }).toList();
