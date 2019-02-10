import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;
  final Color badgeColor;
  final Color badgeTextColor;

  const CartButton({Key key,
    this.onPressed,
    @required this.itemCount,
    this.badgeColor: Colors.red,
    this.badgeTextColor: Colors.white})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CartButtonState();
}

class CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return getShopCartIcon(navigateToShopCartPage);
  }
}

Widget getShopCartIcon(Function onPressed) => IconButton(
  icon: Stack(
    overflow: Overflow.visible,
    children: <Widget>[
      Icon(Icons.shopping_cart),
    ],
  ),
  onPressed: onPressed,
);

void navigateToShopCartPage() {
  print('shop cart pressed 123');
}
