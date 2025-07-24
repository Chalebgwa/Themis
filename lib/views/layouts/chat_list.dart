import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                suffix: IconButton(
                  color: Colors.red,
                  icon: Icon(FontAwesomeIcons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          delegate: SliverChildBuilderDelegate(

            (context, index) => UserItem(),

          ),
        ),
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
