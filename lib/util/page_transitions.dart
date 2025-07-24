import 'package:flutter/material.dart';

class SmoothPageTransition extends PageRouteBuilder {
  final Widget child;
  final Duration duration;

  SmoothPageTransition({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutCubic;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}

class FadePageTransition extends PageRouteBuilder {
  final Widget child;
  final Duration duration;

  FadePageTransition({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

class ScalePageTransition extends PageRouteBuilder {
  final Widget child;
  final Duration duration;

  ScalePageTransition({
    required this.child,
    this.duration = const Duration(milliseconds: 250),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOutCubic;

            var scaleAnimation = Tween(
              begin: 0.8,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: curve,
            ));

            return ScaleTransition(
              scale: scaleAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}