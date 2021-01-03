import 'dart:math';

import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lipsum/lipsum.dart';
import 'package:simon/models/appointment.dart';
import 'package:simon/models/article.dart';
import 'package:simon/models/service_model.dart';

List<Appointment> testData =
    List<Appointment>.generate(400, (index) => genAppointment(index));

Map<String, List<Appointment>> testAppointments = {};

Map<String, List<Appointment>> generateTestData() {
  for (var value in testData) {
    var key = DateFormat.yMd().format(value.range.start);

    if (testAppointments.containsKey(key)) {
      testAppointments[key].add(value);
    } else {
      testAppointments[key] = [value];
    }
  }

  return testAppointments;
}

Appointment genAppointment(int index) {
  final _today = DateTime.now();
  var day = Random().nextInt(10) + _today.day;
  var month = _today.month; //Random().nextInt(11)+1;
  var year = _today.year;
  var hour = Random().nextInt(7) + 9;
  var minute = Random().nextInt(4) * 15;

  var date = DateTime(year, month, day, hour, minute);
  var endDate = date.add(Duration(minutes: 15));
  var type =
      AppointmentType.values[Random().nextInt(AppointmentType.values.length)];
  return Appointment(
    person.name(),
    type,
    createText(
      numParagraphs: 5,
      numSentences: 5,
    ),
    DateTimeRange(
      start: date,
      end: endDate,
    ),
    "assets/${(index % 5) + 1}.png",
  );
}

List<ServiceModel> services = [
  ServiceModel(
      "Our services include advising a wide " +
          " range of clients on tax dispute resolutions," +
          "the High Court, established in terms of the Income Tax Act and also" +
          " tax appeals, tax opinions and value added tax. " +
          "We have acted for and have represented a wide range of clients," +
          " commonly public and private companies as well as parastatals." +
          " We make regular appearances before the board of adjudicators at " +
          " at the Court of Appeal in respect to tax dispute resolutions",
      "Tax",
      "assets/icons/accounting.png",
      200.0,
      LawType.CIVIL),
  ServiceModel(
      "Armstrongs provides advice and services to a large number " +
          "of pre-eminent BSE listed and unlisted companies" +
          " in Botswana on a wide range of corporate issues ranging from Stock Exchange " +
          "compliance, corporate governance, acquisitions," +
          " takeovers, competition law , sell-downs, due diligence " +
          "reviews and income tax structuring. The firm is known as" +
          " the market leader in the field of competition " +
          "law and is instructed on the vast majority of big ticket " +
          "transactions requiring Competition Authority approval.",
      "Corporate",
      "assets/icons/corporation.png",
      200.0,
      LawType.CIVIL),
  ServiceModel(
      "The firm specialises in conveyancing, transfers, " +
          "sectional titles, formulation and registration of securities, " +
          "mortgage bonds, deeds of hypothecation " +
          "and notarial bonds.",
      "Property",
      "assets/icons/home-run.png",
      200.0,
      LawType.CIVIL),
  ServiceModel(
      "The firm has successfully handled a number of exclusive, highly valued matrimonial " +
          " disputes and is headed up by Armstrong’s experienced " +
          "Attorney, Rita Keevil. The practice aims to settle all family matters as " +
          " swiftly and amicably as possible. In " +
          " some instances the litigation skills and financial literacy of " +
          "the practice are essential to a fair resolution of disputes.",
      "Family Law",
      "assets/icons/mother.png",
      200.0,
      LawType.CIVIL),
  ServiceModel(
      "Our Debt Collection Department covers the following areas:" +
          "\n– Loan/credit facility recoveries" +
          "\n– Vehicle repossessions" +
          "\n– Rent arrears recoveries" +
          "\n– Insurance claims" +
          "\n– Eviction" +
          "\n– Cancellation of agreements",
      "Debt collection",
      "assets/icons/debt.png",
      200.0,
      LawType.CIVIL),
];

var person = faker.Person();
var title = faker.Conference();

final testArticles = List<Article>.generate(
  100,
  (index) => Article(
    title.name(),
    createText(
        numParagraphs: Random().nextInt(3) + 1,
        numSentences: Random().nextInt(6) + 1),
    person.name(),
    DateTime.now(),
  ),
);
