import 'package:todo_app/utils/tools/file_importer.dart';

class MyResponse{
  String errorMessage;
  List<TaskModel> tasks;

  MyResponse({ this.tasks=const [], this.errorMessage=''});
}