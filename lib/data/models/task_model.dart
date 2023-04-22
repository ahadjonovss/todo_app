import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TaskModel {
  int id;
  final String title;
  final String category;
  final TimeOfDay time;
  final DateTime day;
  final bool isFinished;
  final bool mustNotify;
  final String boxName;

  TaskModel(
      {required this.title,
      required this.id,
       required  this.boxName ,
      required this.isFinished,
      required this.mustNotify,
      required this.day,
      required this.category,
      required this.time});

  copyWith(
          {int? id,
          String? title,
          String? type,
          TimeOfDay? time,
          bool? isFinished,
            String? boxName,
          bool? mustNotify,
          DateTime? day}) =>
      TaskModel(
        boxName: boxName??this.boxName,
          title: title ?? this.title,
          id: id ?? this.id,
          category: type ?? category,
          time: time ?? this.time,
          day: day ?? this.day,
          isFinished: isFinished ?? this.isFinished,
          mustNotify: mustNotify ?? this.mustNotify);
}
