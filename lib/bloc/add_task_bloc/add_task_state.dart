part of 'add_task_bloc.dart';

@immutable
class AddTaskState extends Equatable{
  TaskModel newTask;

  AddTaskState(this.newTask);

  copyWith({
    TaskModel? taskModel
})=>AddTaskState(taskModel??newTask);

  @override
  List<Object?> get props => [newTask];
}

