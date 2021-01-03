import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simon/models/data.dart';
import 'package:simon/views/components/background_page.dart';
import 'package:simon/views/components/services_item.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      topPadding: 10,
      child: Container(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  text: "Civil",
                  icon: Icon(FontAwesomeIcons.book),
                ),
                Tab(
                  text: "Criminal",
                  icon: Icon(FontAwesomeIcons.bars),
                ),
              ],
            ),
            body: TabBarView(
              children: [
                Container(
                  child: ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServicesItem(
                        service: services[index],
                      );
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ServicesItem(
                        service: services[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
