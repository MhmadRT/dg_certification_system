// To parse this JSON data, do
//
//     final courses = coursesFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Courses coursesFromMap(String str) => Courses.fromMap(json.decode(str));

String coursesToMap(Courses data) => json.encode(data.toMap());

class Courses {
  Courses({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<Datum> data;
  final String message;

  factory Courses.fromMap(Map<String, dynamic> json) => Courses(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.cnum,
    required this.cname,
    required this.startDate,
    required this.endDate,
    required this.timeFrom,
    required this.timeTo,
    required this.trainerId,
    required this.status,
    required this.catId,
  });

  final int cnum;
  final String cname;
  final DateTime startDate;
  final DateTime endDate;
  final String timeFrom;
  final String timeTo;
  final int trainerId;
  final int status;
  final int catId;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    cnum: json["cnum"],
    cname: json["cname"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
    trainerId: json["trainer_id"],
    status: json["Status"],
    catId: json["cat_id"],
  );

  Map<String, dynamic> toMap() => {
    "cnum": cnum,
    "cname": cname,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate.toIso8601String(),
    "time_from": timeFrom,
    "time_to": timeTo,
    "trainer_id": trainerId,
    "Status": status,
    "cat_id": catId,
  };
}
