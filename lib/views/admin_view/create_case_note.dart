import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/appointment_provider.dart';
import 'package:simon/models/appointment.dart';
import 'package:simon/models/slot.dart';
import 'package:simon/views/components/empty_slot_item.dart';

class AdminCalendar extends StatefulWidget {
  AdminCalendar({Key key}) : super(key: key);

  @override
  _AdminCalendarState createState() => _AdminCalendarState();
}

class _AdminCalendarState extends State<AdminCalendar> {
  int numOfapp = 0;

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay = DateTime.now();

  final Map<DateTime, List> _events = {
    DateTime(2020, 9, 14): [
      {'name': 'Event A', 'isDone': true},
    ],
    DateTime(2020, 9, 15): [
      {'name': 'Event A', 'isDone': false},
      {'name': 'Event B', 'isDone': false},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 9, 16): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 9, 17): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 9, 19): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 9, 15): [
      {'name': 'Event A', 'isDone': false},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentProvider>(context);

    return SafeArea(
      child: StreamBuilder<List<Slot>>(
          stream: provider.build(_selectedDay),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("No Appointments");
            }
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Calendar(
                    startOnMonday: true,
                    weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    events: {},
                    onRangeSelected: (range) =>
                        print("Range is ${range.from}, ${range.to}"),
                    onDateSelected: (date) => _handleNewDate(date),
                    isExpandable: true,
                    eventDoneColor: Colors.green,
                    selectedColor: Theme.of(context).accentColor,
                    todayColor: Colors.yellow,
                    eventColor: Colors.grey,
                    bottomBarColor: Colors.grey.shade200,
                    hideBottomBar: true,
                    initialDate: _selectedDay,
                    bottomBarArrowColor: Colors.black,
                    dayOfWeekStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                    ),
                  ),
                ),
                Divider(),
                _buildEventList(snapshot.data)
              ],
            );
          }),
    );
  }

  Widget _buildEventList(List<Slot> slots) {
    return Expanded(
      child: ListView.builder(
        itemCount: slots.length,
        itemBuilder: (BuildContext context, int index) => SlotItem(
          slot: slots[index],
        ),
      ),
    );
  }
}
