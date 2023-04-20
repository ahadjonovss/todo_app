part of 'update_task_bloc.dart';

@immutable
class UpdateTaskState extends Equatable{
  TaskModel newTask;

  UpdateTaskState(this.newTask);

  copyWith({
    TaskModel? taskModel
  })=>UpdateTaskState(taskModel??newTask);

  @override
  List<Object?> get props => [newTask];
}

