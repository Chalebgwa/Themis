import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/appointment_provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/models/appointment.dart';
import 'package:simon/models/data.dart';
import 'package:simon/models/service_model.dart';
import 'package:simon/models/slot.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({Key key, this.slot}) : super(key: key);
  final Slot slot;

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  // The type of [ServiceModel] required by a service
  // set using a drop down
  ServiceModel service;

  // Small description of the case
  TextEditingController _controller = TextEditingController();

  // start and end of appointment
  DateTime start;
  DateTime end;

  RangeValues _rangeValues = RangeValues(0, 15);

  // save appointment
  void addAppointment() {
    
    final provider = Provider.of<AppointmentProvider>(context,listen: false);
    final user = Provider.of<Auth>(context,listen: false).currentUser;
    final desc = _controller.text;
    Navigator.pop(context);
    provider.addAppointment(user, service, start, end, desc);
    
  }

  @override
  Widget build(BuildContext context) {
    //
    start = widget.slot.range.start;
    end = widget.slot.range.start;
    //
    final startDuration = Duration(minutes: _rangeValues.start.toInt());
    final endDuration = Duration(minutes: _rangeValues.end.toInt());
    //
    final _startTimeLabel = DateFormat.Hm().format(start.add(startDuration));
    final _endTimeLabel = DateFormat.Hm().format(end.add(endDuration));

    //
    final _date = DateFormat.yMMMEd().format(widget.slot.range.start);
    final timeStyle = TextStyle(color: Colors.black, fontSize: 30);

    //
    final accentColor = Theme.of(context).accentColor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _date,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _startTimeLabel,
                    style: timeStyle,
                  ),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    color: accentColor,
                  ),
                  Text(
                    _endTimeLabel,
                    style: timeStyle,
                  ),
                ],
              ),
              SliderTheme(
                data: Theme.of(context).sliderTheme.copyWith(
                    activeTrackColor: accentColor,
                    minThumbSeparation: 15,
                    overlayColor: Colors.black,
                    inactiveTrackColor: Colors.black,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                child: RangeSlider(
                  divisions: widget.slot.range.duration.inMinutes ~/ 15,
                  labels: null,
                  onChanged: (RangeValues value) {
                    setState(
                      () {
                        _rangeValues = value;
                      },
                    );
                  },
                  values: _rangeValues,
                  min: 0,
                  max: widget.slot.range.duration.inMinutes.toDouble(),
                  onChangeEnd: (value) {
                    double _range = value.end - value.start;
                    double end =
                        widget.slot.range.duration.inMinutes.toDouble();
                    if (_range == 0) {
                      if (value.end == end) {
                        setState(() {
                          _rangeValues =
                              RangeValues(value.start - 15, value.end);
                        });
                      } else {
                        setState(() {
                          _rangeValues =
                              RangeValues(value.start, value.end + 15);
                        });
                      }
                    } else if (_range > 60) {
                      setState(() {
                        _rangeValues =
                            RangeValues(value.start + (_range - 60), value.end);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<ServiceModel>(
                  dropdownColor: accentColor,
                  itemHeight: 50,
                  elevation: 30,
                  value: service,
                  hint: Text(
                    "Select Service",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                  ),
                  isExpanded: true,
                  isDense: false,
                  items: services
                      .map(
                        (e) => DropdownMenuItem<ServiceModel>(
                          child: Text(e.name),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      service = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  minLines: 3,
                  maxLines: 5,
                  controller: _controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Description(Optional)",
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: addAppointment,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text("Book Appointment"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
