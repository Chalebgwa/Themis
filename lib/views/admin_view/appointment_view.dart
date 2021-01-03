import 'package:calendarro/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simon/models/appointment.dart';
import 'dart:math' as math;

class ViewAppointment extends StatelessWidget {
  const ViewAppointment({Key key, this.appointment}) : super(key: key);

  final Appointment appointment;

  Duration countdown(int x) {
    final duration = appointment.range.start.difference(DateTime.now());
    return duration;
  }

  String formatTime(DateTime date) {
    return DateFormat.Hms().format(date);
  }

  double value(Duration duration) {
    final x = duration.inSeconds;
    final y = ((math.pi / 2) - math.tan(x)) / math.pi / 2;
    print(y);

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final url = appointment.imageUrl;
    final midnight = DateUtils.toMidnight(DateTime.now());

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Description"),
              Tab(text: "Case"),
              Tab(text: "Notes"),
            ],
          ),
          backgroundColor: Colors.black,
          body: StreamBuilder<Duration>(
            stream: Stream.periodic(Duration(seconds: 1), countdown),
            builder: (context, snapshot) {
              var duration = snapshot.data ?? Duration();
              var add = midnight.add(duration);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Hero(
                                tag: appointment,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(url),
                                  radius: 50,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Hero(
                                tag: "ipc"+appointment.userid,
                                child: Material(
                                  color: Colors.transparent,
                                  child: CircularPercentIndicator(
                                    progressColor:
                                        Theme.of(context).accentColor,
                                    animation: true,
                                    percent: value(duration),
                                    startAngle: 0.0,
                                    radius: 100,
                                    center: Text(
                                      formatTime(
                                        add,
                                      ),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          appointment.userid,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          appointment.description,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
