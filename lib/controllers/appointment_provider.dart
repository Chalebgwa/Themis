import 'package:calendarro/date_range.dart';
import 'package:calendarro/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simon/models/appointment.dart';
import 'package:simon/models/data.dart';
import 'package:simon/models/service_model.dart';
import 'package:simon/models/slot.dart';
import 'package:simon/models/user.dart';

class AppointmentProvider extends ChangeNotifier {
  Map<String, List<Appointment>> _appointments = generateTestData();
  Map<String, List<Appointment>> get appiointments => _appointments;
  List<Slot> _slots = [];
  List<Slot> get slots => _slots;

  Appointment getNextAppointment() {
    final key = DateFormat.yMd().format(DateTime.now());
    var apps = _appointments[key];
    if (apps != null) {
      apps.sort();
    } else {
      apps = [];
    }
    return apps.firstWhere(
      (element) => element.range.start.isAfter(
        DateTime.now(),
      ),
      orElse: () => null,
    );
  }

  Stream<List<Appointment>> mappedAppointments(DateTime date) {
    var format = DateFormat.yMd().format(date);
    List<Appointment> _apps = _appointments[format];
    return Stream.fromIterable([_apps]);
  }

  Stream<List<Slot>> build(DateTime date) {
    var format = DateFormat.yMd().format(date);
    var init = DateUtils.toMidnight(date).add(Duration(hours: 9));
    var last = DateUtils.toMidnight(date).add(Duration(hours: 17));
    List<Appointment> _apps = _appointments[format] ?? [];
    //_apps.sort();
    // var midnight = DateUtils.toMidnight(DateTime.now());

    // var indexedList = List(540);
    // for (var ap in _apps) {
    //   int start = ap.range.start.difference(midnight).inMinutes - 540;
    //   int end = ap.range.end.difference(midnight).inMinutes - 540;

    //   indexedList.fillRange(start, end, ap);
    // }

    List<Slot> _slots = [];

    if (_apps.isNotEmpty) {
      for (var i = 0; i < _apps.length - 1; i++) {
        var item = _apps[i];
        var nextItem = _apps[i + 1];

        var duration = nextItem.range.start.difference(item.range.end);
        var bookedSlot = Slot(item.range, true, item);
        _slots.add(bookedSlot);

        if (duration.inMinutes > 25) {
          var start = item.range.end; //.add(Duration(minutes: 10));
          var end = nextItem.range.start; //.subtract(Duration(minutes: 10));

          var range = DateTimeRange(start: start, end: end);

          var emptySlot = Slot(range, false, null);
          _slots.add(emptySlot);
        }
        //if (range.duration.inMinutes >= 15) {

        //}
      }

      if (_slots[0].range.start.isAfter(init)) {
        var initRange = DateTimeRange(start: init, end: _slots[0].range.start);
        var slot = Slot(initRange, false, null);
        _slots.insert(0, slot);
      }

      if (_slots.last.range.end.isBefore(last)) {
        var lastRange = DateTimeRange(start: _slots.last.range.end, end: last);
        var slot = Slot(lastRange, false, null);
        _slots.add(slot);
      }
    }
    return Stream.fromIterable([_slots]);
  }

  Future<void> addAppointment(User user, ServiceModel service, DateTime start,
      DateTime end, String desc) async {
    final appointment = Appointment(user.id, AppointmentType.CONSULTATION, desc,
        DateTimeRange(start: start, end: end), user.imageUrl);
    final key = DateFormat.yMd().format(start);
    if (_appointments.containsKey(key)) {
      _appointments[key].add(appointment);
    } else {
      _appointments[key] = [appointment];
    }
    notifyListeners();
  }
}

main(List<String> args) {
  var provider = AppointmentProvider();
  print(provider.slots);
}
