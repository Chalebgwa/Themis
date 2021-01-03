import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/models/user.dart';
import 'package:simon/views/components/background_page.dart';
import 'package:simon/views/components/profile_pricture.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tabs = [
      Tab(text: "Tab 1"),
      Tab(text: "Tab 2"),
      Tab(text: "Tab 3"),
      Tab(text: "Tab 4"),
    ];

    final user = Provider.of<Auth>(context).currentUser;
    return BackgroundPage(
      topPadding: 6,
      opacity: .8,
      child: DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: buildProfileHeader(user),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("$index"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileHeader(User user) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          child: Column(
            children: [
              //ProfilePicture(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${user.firstname} ${user.surname}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          child: Icon(
                            FontAwesomeIcons.phoneAlt,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.red.shade300,
                          onPressed: () {},
                          child: Icon(
                            FontAwesomeIcons.envelope,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
