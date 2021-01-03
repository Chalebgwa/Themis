import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    this.height = 200,
    this.color = Colors.white,
  }) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: Container(
        child: Image.asset(
          "assets/icon.png",
          fit: BoxFit.contain,
          height: height,
          width: height,
          color: color,
        ),
      ),
    );
  }
}
