part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  List<TaskModel> tasks;
  String message;
  FormStatus status;

  TasksState(
      {required this.tasks, required this.message, required this.status});

  copyWith({
    List<TaskModel>? tasks,
    String? message,
    FormStatus? status,
  }) =>
      TasksState(
          status: status ?? this.status,
          message: message ?? this.message,
          tasks: tasks ?? this.tasks);


  @override
  List<Object?> get props => [
    tasks,
    message,
    status
  ];
}
