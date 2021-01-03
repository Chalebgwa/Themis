import 'package:flutter/material.dart';
import 'package:simon/models/appointment.dart';

class Slot {
  final DateTimeRange range;
  final bool iSbooked;
  final Appointment appointment;

  Slot(this.range, this.iSbooked, this.appointment);
}
