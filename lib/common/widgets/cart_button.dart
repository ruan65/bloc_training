import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;
  final Color badgeColor;
  final Color badgeTextColor;

  const CartButton(
      {Key key,
      this.onPressed,
      @required this.itemCount,
      this.badgeColor: Colors.red,
      this.badgeTextColor: Colors.white})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CartButtonState();
}

class CartButtonState extends State<CartButton> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}
