part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent {}

class GetAllTasks extends TasksEvent{}
