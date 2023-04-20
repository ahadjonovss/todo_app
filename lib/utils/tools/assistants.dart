import 'package:flutter/material.dart';
import 'package:todo_app/data/models/category_model.dart';

CategoryModel detectCategory(String title){
  for(int i=0;i<categories.length;i++){
    if(categories[i].title==title){
      return categories[i];
    }
  }
  return categories[0];
}

String getTime(TimeOfDay time){
  int hour = time.hour;
  int minute = time.minute;

  String hourRes = hour<10?"0$hour":hour.toString();
  String minuteRes = minute<10?"0$minute":minute.toString();

  return "$hourRes : $minuteRes";
}