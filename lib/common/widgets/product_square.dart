import 'package:bloc_example/common/model/product.dart';
import 'package:bloc_example/common/utils/is_dark.dart';
import 'package:flutter/material.dart';

class ProductSquare extends StatelessWidget {
  final Product product;
  final GestureTapCallback onTap;

  const ProductSquare({Key key, this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: product.color,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            product.name,
            style: TextStyle(
                color: isDark(product.color) ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
