import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;

  const CartButton({
    Key key,
    this.onPressed,
    this.itemCount = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CartButtonState();
}

class CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return getShopCartIcon(widget.onPressed, widget.itemCount.toString());
  }
}

Widget getShopCartIcon(Function onPressed, String text) => IconButton(
      icon: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Icon(Icons.shopping_cart),
          Positioned(
            top: -8.0,
            right: -3.0,
            child: Material(
              type: MaterialType.circle,
              elevation: 2.0,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
