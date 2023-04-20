part of 'update_task_bloc.dart';

@immutable
abstract class UpdateTaskEvent {}

class UpdateTaskInfoEvent extends UpdateTaskEvent{
  int? id;
  String? title;
  String? type;
  TimeOfDay? time;

  UpdateTaskInfoEvent({
    this.time,
    this.type,
    this.id,
    this.title
  });
}

class AddCurrentTaskEvent extends UpdateTaskEvent{}