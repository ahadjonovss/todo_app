import 'package:todo_app/utils/tools/file_importer.dart';

class MyResponse{
  String errorMessage;
  List<TaskModel> tasks;

  MyResponse({required this.tasks,required this.errorMessage});
}