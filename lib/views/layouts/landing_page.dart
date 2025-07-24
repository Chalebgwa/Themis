import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simon/chat/home.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/views/components/background_page.dart';
import 'package:simon/views/components/tiles.dart';
import 'package:simon/views/layouts/calendar_view.dart';
import 'package:simon/views/layouts/chat.dart';
import 'package:simon/views/layouts/chat_list.dart';
import 'package:simon/views/layouts/forms/services_list.dart';
import 'package:simon/views/layouts/news.dart';
import 'package:simon/views/layouts/planner.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<Auth>(context, listen: false).currentUser;
    
    return BackgroundPage(
      opacity: .4,
      child: CustomScrollView(
        dragStartBehavior: DragStartBehavior.start,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Greeting(),
                  SearchField(),
                  Title(),
                ],
              ),
            ),
            padding: EdgeInsets.only(top: size.height/20),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(size.width),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildListDelegate([
              FGridTile(
                iconData: FontAwesomeIcons.pooStorm,
                label: "Our People",
                color: Colors.orange,
                page: Material(
                  child: Center(
                    child: Container(
                      child: Text("Widget Locked"),
                    ),
                  ),
                ),
              ),
              FGridTile(
                  iconData: FontAwesomeIcons.moneyBillWave,
                  label: "News & Insights",
                  color: Colors.purple,
                  page: NewsFeed()),
              FGridTile(
                  iconData: FontAwesomeIcons.userFriends,
                  label: "Careers",
                  color: Colors.red,
                  page: Flanner()),
              FGridTile(
                iconData: FontAwesomeIcons.robot,
                label: "Chat",
                color: Colors.pinkAccent,
                page: Inbox(currentUserId: user?.id ?? 'default'),
              ),
              FGridTile(
                iconData: FontAwesomeIcons.calendarDay,
                label: "Calendar",
                color: Colors.brown,
                page: CalendarView(),
              ),
              FGridTile(
                iconData: FontAwesomeIcons.fileSignature,
                label: "Services",
                color: Colors.teal,
                page: ServicesList(),
              ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 800) return 4;
    if (width > 600) return 3;
    return 2;
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "What do you need?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFeatures: [FontFeature.randomize()],
          fontSize: 20,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final firstName = auth.currentUser?.firstname ?? 'User';
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: "Hello,\n",
          style: TextStyle(
            color: Colors.white, 
            fontSize: 29, 
            fontWeight: FontWeight.w100,
          ),
          children: [
            TextSpan(
              text: firstName,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: "Search services, people, or cases...",
          prefixIcon: Icon(
            FontAwesomeIcons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
