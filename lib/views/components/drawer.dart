import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FancyDrawer extends StatelessWidget {
  const FancyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        child: Material(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DrawerItem(
                label: "Otion 1",
              ),
              DrawerItem(
                label: "Otion 2",
              ),
              DrawerItem(
                label: "Otion 3",
              ),
              DrawerItem(
                label: "Otion 4",
              ),
              DrawerItem(
                label: "Otion 5",
              ),
            ],
          ),
        ));
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key key,
    this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          title: Text(label),
          leading: Icon(FontAwesomeIcons.cog),
        ),
      ),
    );
  }
}
