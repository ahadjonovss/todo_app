part of 'add_task_bloc.dart';

@immutable
abstract class AddTaskEvent {}

class UpdateTaskInformationEvent extends AddTaskEvent{
  int? id;
  String? title;
  String? type;
  TimeOfDay? time;

  UpdateTaskInformationEvent({
    this.time,
    this.type,
    this.id,
    this.title
});
}

class AddCurrentTaskEvent extends AddTaskEvent{}
