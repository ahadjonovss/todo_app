part of 'update_task_bloc.dart';

@immutable
abstract class UpdateTaskEvent {}

class UpdateTaskInfoEvent extends UpdateTaskEvent{
  int? id;
  String? title;
  String? type;
  TimeOfDay? time;
  String? boxName;

  UpdateTaskInfoEvent({
    this.time,
    this.type,
    this.id,
    this.title,
    this.boxName,
  });
}

class UpdateInfoOfCurrentTaskEvent extends UpdateTaskEvent{
  TaskModel item;

  UpdateInfoOfCurrentTaskEvent(this.item);
}