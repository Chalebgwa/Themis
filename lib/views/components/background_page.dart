import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simon/views/components/clippers.dart';
import 'package:simon/views/components/logo.dart';
import 'package:simon/views/components/profile_pricture.dart';
import 'package:simon/views/layouts/profile.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({
    Key key,
    @required this.child,
    this.opacity = .6,
    this.blur = 1,
    this.pageTitle = "",
    this.clipContainer = true,
    this.topPadding = 15,
    this.sidePadding = 20,
    this.showAppbar = true,
    this.fab,
  }) : super(key: key);

  final Widget child;
  final double opacity;
  final double blur;
  final String pageTitle;
  final bool clipContainer;
  final double topPadding;
  final double sidePadding;
  final bool showAppbar;
  final FloatingActionButton fab;

  @override
  _BackgroundPageState createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  final double maxSlide = 200.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    //_animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleNavBar() {
    if (_animationController.isCompleted)
      _animationController.reverse();
    else
      _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.white),
          Container(
            child: ClipPath(
              clipper: BackpageClipper(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/back2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(widget.opacity),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: widget.fab,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leadingWidth: 90,
              toolbarHeight: 100,
              elevation: 0,
              actionsIconTheme: IconThemeData(
                color: Colors.white,
              ),
              actions: [],
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Logo(
                  height: 90,
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(
                top: widget.topPadding,
                left: widget.sidePadding,
                right: widget.sidePadding,
              ),
              child: widget.child,
            ),
          ),
          Positioned(
            height: 70,
            right: 10,
            top: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfilePicture(
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopIcons extends StatelessWidget {
  const TopIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.black,
      height: 90,
      //width: double.infinity,
      //color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Logo(
                  height: 70,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (context) => Profile(),
                  );
                  Navigator.push(context, route);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
