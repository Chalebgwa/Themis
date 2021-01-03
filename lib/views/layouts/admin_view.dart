import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/appointment_provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/models/user.dart';
import 'package:simon/views/components/clippers.dart';
import 'package:simon/views/components/profile_pricture.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final user = auth.currentUser;
    final apProvider = Provider.of<AppointmentProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back2.jpg"),
                  fit: BoxFit.cover,
                  //alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.9),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: Colors.white),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProfilePicture(
                              borderColor: Theme.of(context).accentColor,
                              size: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${user.firstname} ${user.surname}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildTabButton(FlutterIcons.call_to_action_mdi,"Activity"),
                                VerticalDivider(
                                  color: Theme.of(context).accentColor,
                                  width: 10,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                               _buildTabButton(FlutterIcons.call_to_action_mdi,"Activity"),
                                VerticalDivider(
                                  color: Theme.of(context).accentColor,
                                  width: 10,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                _buildTabButton(FlutterIcons.call_to_action_mdi,"Activity"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverAnimatedList(
                    initialItemCount: 10,
                    itemBuilder: _buildItem,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return ProfileButton(
      animation: animation,
    );
  }

  Widget _buildTabButton(IconData data,String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          data,
          color: Theme.of(context).accentColor,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final Animation<double> animation;

  const ProfileButton({Key key, this.animation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.red,
          height: 200,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(),
              
            ],
          ),
        ),
      ),
    );
  }
}
