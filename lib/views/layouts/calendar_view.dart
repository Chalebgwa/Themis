import 'package:calendarro/date_utils.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:calendarro/calendarro.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/appointment_provider.dart';
import 'package:simon/models/slot.dart';
import 'package:simon/views/components/background_page.dart';
import 'package:simon/views/components/empty_slot_item.dart';

class CalendarView extends StatefulWidget {
  CalendarView({Key key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  Calendarro monthCalendarro;
  DateTime _selectedDate = DateUtils.toMidnight(DateTime.now());
  DatePickerController _datePickerController = DatePickerController();
  var duration = 15;

  String format(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<AppointmentProvider>(context);
    final startDate = DateUtils.toMidnight(DateTime.now());
    final Color accentColor = Theme.of(context).accentColor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat.y().format(_selectedDate),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DatePicker(
                startDate,
                initialSelectedDate: startDate,
                controller: _datePickerController,
                selectedTextColor: Colors.white,
                selectionColor: accentColor,
                dateTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                monthTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                ),
                dayTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                ),
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                //daysCount: 10,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: accentColor.withOpacity(.3),
                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildChip(15),
                        _buildChip(30),
                        _buildChip(45),
                        _buildChip(60),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Container(
                child: StreamBuilder<List<Slot>>(
                  stream: appointments.build(_selectedDate),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else
                        return Center(
                          child: Text("No Empty slots found"),
                        );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = snapshot.data[index];

                        return SlotItem(slot: item);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(int time) {
    final Color accentColor = Theme.of(context).accentColor;
    return GestureDetector(
      onTap: () {
        setState(() {
          duration = time;
        });
      },
      child: Chip(
        label: Text(
          "$time min",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 3,
        backgroundColor: duration == time ? accentColor.withOpacity(.5) : accentColor.withOpacity(.2),
      ),
    );
  }
}
