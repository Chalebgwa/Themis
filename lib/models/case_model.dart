import 'package:simon/models/service_model.dart';
import 'package:simon/models/user.dart';

enum CaseState { ACTIVE, CLOSED }

class CaseModel {
  final String caseNumber;
  final User client;
  final CaseState state;
  final ServiceModel service;
  final DateTime start;
  final DateTime end;
  final String description;

  CaseModel(this.caseNumber, this.client, this.state, this.service, this.start, this.end, this.description);
}
