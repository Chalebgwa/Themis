import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simon/models/appointment.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({Key key, this.appointment}) : super(key: key);

  final Appointment appointment;

  String formatTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 70,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          formatTime(appointment.range.start),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          formatTime(appointment.range.end),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                color: Colors.red,
                thickness: 2,
                endIndent: 10,
                indent: 10,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  //color: Colors.black,
                  child: ListTile(
                      title: Text(appointment.userid),
                      subtitle: Text(
                        appointment.type.toString().substring(16),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
