import 'package:todo_app/utils/tools/file_importer.dart';

class MyResponse{
  String errorMessage;
  List<List<TaskModel>> tasks;

  MyResponse({ required this.tasks, this.errorMessage=''});
}