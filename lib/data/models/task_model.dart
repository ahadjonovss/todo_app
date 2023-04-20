import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final String title;
  final String category;
  final TimeOfDay time;
  final DateTime day;

  TaskModel(
      {required this.title,
      required this.id,
        required this.day,
      required this.category,
      required this.time});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      title: json["title"] ?? '',
      id: json["id"] ?? -1,
      category: json["type"] ?? '',
      day: DateTime.parse(json["day"]),
      time: TimeOfDay(hour: json["time"].split(":")[0], minute: json["time"].split(":")[1]));


  toJson()=>{
    "id":id,
    "title":title,
    "type":category,
    "time":time.toString(),
    "day":day.toString()
  };

  copyWith({
     int? id,
     String? title,
     String? type,
     TimeOfDay? time,
    DateTime? day
})=>TaskModel(title: title??this.title, id: id??this.id, category: type??category, time: time??this.time,day: day??this.day);
}
