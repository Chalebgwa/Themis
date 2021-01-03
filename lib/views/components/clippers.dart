import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(x, 0);
    path.lineTo(x, y * .1);
    path.cubicTo(x * .8, y * .9, x * .3, y * .3, x * .0, y * .9);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BackpageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(x, 0);
    path.lineTo(x, y * .3);
    path.cubicTo(x * 1.0, y * .6, x * .0, y * .3, x * .0, y * .6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ProfileImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path();
    // path.addPolygon(
    //   [
    //     Offset(x * .5, y * .0),
    //     Offset(x * .0, y * .2),
    //     Offset(x * .0, y * .8),
    //     Offset(x * .5, y * 1.0),
    //     Offset(x * 1.0, y * .8),
    //     Offset(x * 1.0, y * .2),
    //   ],
    //   true,
    // );

    path.moveTo(x * .5, y * .0);
    path.lineTo(x * .0, y * .2);
    path.lineTo(x * .0, y * .8);
    path.lineTo(x * .5, y * 1.0);
    path.lineTo(x * 1.0, y * .8);
    path.lineTo(x * 1.0, y * .2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ProfileClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path();
    path.lineTo(x, 0);
    path.lineTo(x, y * .9);
    path.quadraticBezierTo(x * .1, y * .9, 0, y * .3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ProfileClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    var path = Path();
    path.lineTo(0, y * .9);
    path.quadraticBezierTo(x * .7, y * .9, x, y * .5);
    path.lineTo(x, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ProfileClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;
    var path = Path();
    path.moveTo(0, y * 0.6);
    path.quadraticBezierTo(
      x * .75,
      y * .9,
      x,
      y * 0.45,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
