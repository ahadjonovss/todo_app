part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent {}

class GetAllTasks extends TasksEvent{}
class UpdateCurrentTaskEvent extends TasksEvent{
  TaskModel task;
  UpdateCurrentTaskEvent(this.task);
}

class DeleteTaskEvent extends TasksEvent{
  int id;
  DeleteTaskEvent(this.id);
}
