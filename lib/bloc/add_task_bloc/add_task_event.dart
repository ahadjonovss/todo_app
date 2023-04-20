part of 'add_task_bloc.dart';

@immutable
abstract class AddTaskEvent {}

class UpdateTaskEvent extends AddTaskEvent{
  int? id;
  String? title;
  String? type;
  TimeOfDay? time;

  UpdateTaskEvent({
    this.time,
    this.type,
    this.id,
    this.title
});
}
