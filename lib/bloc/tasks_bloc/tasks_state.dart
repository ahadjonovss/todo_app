part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  List<List<TaskModel>> tasks;
  List<CategoryModel> categories;
  String message;
  FormStatus status;
  bool needShowTaskBar;

  TasksState(
      {
        required this.categories,
        required this.tasks, required this.message, required this.status,required this.needShowTaskBar});

  copyWith({
    List<List<TaskModel>>? tasks,
    String? message,
    FormStatus? status,
    bool? needShowTaskBar,
    List<CategoryModel>? categories

  }) =>
      TasksState(
        categories:categories??this.categories ,
        needShowTaskBar: needShowTaskBar??this.needShowTaskBar,
          status: status ?? this.status,
          message: message ?? this.message,
          tasks: tasks ?? this.tasks);


  @override
  List<Object?> get props => [
    tasks,
    message,
    status,
    needShowTaskBar,
    categories
  ];
}
