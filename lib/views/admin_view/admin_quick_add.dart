import 'package:flutter/material.dart';
import 'package:simon/views/admin_view/create_case_note.dart';
import 'package:simon/views/layouts/calendar_view.dart';

class QuickAdd extends StatelessWidget {
  QuickAdd({Key key}) : super(key: key);

  final _tabs = [
    Tab(
      text: "Calendar",
    ),
    Tab(
      text: "Add Event",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            tabs: _tabs,
          ),
          body: TabBarView(
            children: [
              AdminCalendar(),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
