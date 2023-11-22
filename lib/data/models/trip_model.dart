import 'package:safe_trip_driver_app/data/models/route_model.dart';
import 'package:safe_trip_driver_app/data/models/supervisor_model.dart';

import '../../index.dart';
@HiveType(typeId: 1)
class TripModel {

  final int id;
  final int busId;
  final int passengerAvailable;
  final String day;
  final String timeStart;
  final String timeEnd;
  final String actualTimeStart;
  final String actualTimeEnd;
  late final String status;
  final RouteModel route;
  final SupervisorModel supervisor;

  TripModel({
    required this.id,
    required this.busId,
    required this.passengerAvailable,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
    required this.actualTimeStart,
    required this.actualTimeEnd,
    required this.status,
    required this.route,
    required this.supervisor
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(

      id: json['id'],
      busId: json['bus_id'],
      passengerAvailable: json['passenger_available'],
      day: json['day'],
      timeStart: json['time_start'],
      timeEnd: json['time_end'],
      actualTimeStart: json['actual_time_start'],
      actualTimeEnd: json['actual_time_end'],
      status: json['status'],
      route: RouteModel.fromJson(json['route']),
      supervisor: SupervisorModel.fromJson(json['supervisor']),
    );
  }
}