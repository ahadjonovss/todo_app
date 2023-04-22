part of 'add_task_bloc.dart';

@immutable
class AddTaskState extends Equatable{
  TaskModel newTask;
  FormStatus status;

  AddTaskState(this.newTask,{required this.status});

  copyWith({
    TaskModel? taskModel,
    FormStatus? status

  })=>AddTaskState(taskModel??newTask,status: status??this.status);

  @override
  List<Object?> get props => [newTask,status];
}

