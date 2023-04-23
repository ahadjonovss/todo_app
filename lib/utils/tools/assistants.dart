import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/models/category_model.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

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

String getDay(String dateTimeString){
 if(dateTimeString==DateTime.now().toString().split(' ').first){
   return "Today";
 }else if(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(const Duration(days: 1)).toString().split(' ').first==dateTimeString){
   return "Yesterday";
 }
 else{
   DateTime dateTime = DateTime.parse(dateTimeString);
   String weekDay = DateFormat('EEEE').format(dateTime);
   String monthName = DateFormat('MMMM').format(dateTime);
   return "${dateTime.day} - $monthName, $weekDay";
 }




}


bool isListEmpty(List<List<TaskModel>> tasks){
  for(List i in tasks){
      if(i.isNotEmpty){
        return false;
      }
  }
  return true;

}