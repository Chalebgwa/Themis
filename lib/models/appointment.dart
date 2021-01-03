import 'package:flutter/material.dart';

enum AppointmentType { CONSULTATION }

class Appointment extends Comparable<Appointment> {
  final DateTimeRange range;
  final String userid;
  final AppointmentType type;
  final String description;
  final String imageUrl;

  Appointment(this.userid, this.type, this.description, this.range, this.imageUrl);

  @override
  int compareTo(Appointment other) {
    if (range.start.isBefore(other.range.start)) {
      return -1;
    }
    return 1;
  }
}
