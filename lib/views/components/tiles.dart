import 'package:flutter/material.dart';
import 'package:simon/util/page_transitions.dart';

class FGridTile extends StatefulWidget {
  const FGridTile({Key? key, this.label, this.iconData, this.color, this.page})
      : super(key: key);
  final String? label;
  final IconData? iconData;
  final Color? color;
  final Widget? page;

  @override
  State<FGridTile> createState() => _FGridTileState();
}

class _FGridTileState extends State<FGridTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.white,
                        spreadRadius: .1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    onTapCancel: _onTapCancel,
                    onTap: () {
                      if (widget.page != null) {
                        Navigator.of(context).push(
                          SmoothPageTransition(child: widget.page!),
                        );
                      }
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Hero(
                              tag: widget.label ?? '',
                              child: Icon(
                                widget.iconData,
                                color: widget.color,
                                size: 32,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Text(
                                  widget.label ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  height: 3,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: widget.color,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                          )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeTile extends StatefulWidget {
  const TimeTile({Key? key, this.time}) : super(key: key);

  final String? time;

  @override
  _TimeTileState createState() => _TimeTileState();
}

class _TimeTileState extends State<TimeTile> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          widget.time ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
