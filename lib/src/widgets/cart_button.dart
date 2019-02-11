import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;

  const CartButton({
    Key key,
    this.onPressed,
    @required this.itemCount,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CartButtonState();
}

class CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  final Tween<Offset> _badgePositionTween = Tween(
    begin: const Offset(-.5, .9),
    end: const Offset(0.0, 0.0),
  );

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 600),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);

    _animationController.forward();
  }

  @override
  void didUpdateWidget(CartButton oldWidget) {
    if (widget.itemCount != oldWidget.itemCount) {
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return getShopCartIcon(widget.onPressed, widget.itemCount.toString());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget getShopCartIcon(Function onPressed, String text) => IconButton(
        icon: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Icon(Icons.shopping_cart),
            Positioned(
              top: -8.0,
              right: -3.0,
              child: SlideTransition(
                position: _badgePositionTween.animate(_animation),
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
            ),
          ],
        ),
        onPressed: onPressed,
      );
}
