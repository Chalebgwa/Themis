import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// A wrapper widget that helps prevent unnecessary rebuilds
/// by using const constructors and RepaintBoundary
class PerformanceWrapper extends StatelessWidget {
  final Widget child;
  final bool addRepaintBoundary;

  const PerformanceWrapper({
    Key? key,
    required this.child,
    this.addRepaintBoundary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (addRepaintBoundary) {
      return RepaintBoundary(child: child);
    }
    return child;
  }
}

/// A mixin to add smooth animation capabilities to any widget
mixin SmoothAnimationMixin<T extends StatefulWidget> on State<T>
    implements TickerProvider {
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start animation automatically
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildAnimatedChild(Widget child) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: child,
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

/// A custom PageRoute that provides smooth transitions
class SmoothRoute<T> extends PageRoute<T> {
  final Widget child;
  final Duration transitionDuration;

  SmoothRoute({
    required this.child,
    this.transitionDuration = const Duration(milliseconds: 300),
    RouteSettings? settings,
  }) : super(settings: settings);

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => this.transitionDuration;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return child;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
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
  }
}

/// Helper class for performance optimization
class PerformanceHelper {
  /// Debounce function calls to improve performance
  static void debounce(
    String key,
    VoidCallback callback, {
    Duration delay = const Duration(milliseconds: 300),
  }) {
    _timers[key]?.cancel();
    _timers[key] = Timer(delay, callback);
  }

  static final Map<String, Timer> _timers = {};

  /// Pre-cache images for better performance
  static Future<void> precacheImages(
    BuildContext context,
    List<String> imagePaths,
  ) async {
    for (final path in imagePaths) {
      try {
        await precacheImage(AssetImage(path), context);
      } catch (e) {
        debugPrint('Failed to precache image: $path');
      }
    }
  }
}