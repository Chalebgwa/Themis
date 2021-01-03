import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simon/views/admin_view/admin_quick_add.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:simon/views/admin_view/admin_page.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key key}) : super(key: key);

  @override
  _AdminViewState createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  int currentPage = 0;

  PageController _pageController = PageController();

  void switchPage(int page) {
    _pageController.jumpToPage(page);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/back2.jpg",
                ),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(.8),
            body: PageView(
              controller: _pageController,
              allowImplicitScrolling: false,
              //pageSnapping: false,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AdminHome(),
                QuickAdd(),
              ],
            ),
            // bottomNavigationBar: CircleBottomNavigation(
            //   //barHeight: 70,
            //   //shadowAllowance: 50,
            //   //circleOutline: 0,
            //   //arcHeight: 0,
            //   arcWidth: 0,
            //   blurShadowRadius: 0,

            //   circleSize: 60,
            //   initialSelection: currentPage,
            //   inactiveIconColor: Colors.white,
            //   activeIconColor: Theme.of(context).accentColor,
            //   barBackgroundColor: Colors.black,
            //   textColor: Colors.white,
            //   circleColor: Colors.black,
            //   hasElevationShadows: true,

            //   tabs: [
            //     TabData(
            //       icon: FlutterIcons.home_ant,
            //       iconSize: 35,
            //       title: 'Home',
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     TabData(
            //       icon: FlutterIcons.calendar_ant,
            //       iconSize: 35,
            //       title: 'Calendar',
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     TabData(
            //       icon: FlutterIcons.file_document_mco,
            //       iconSize: 35,
            //       title: 'Cases',
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     TabData(
            //       icon: Icons.alarm,
            //       iconSize: 35,
            //       title: 'Alarm',
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ],
            //   onTabChangedListener: (page) {
            //     switchPage(page);
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
