import 'package:todo_app/utils/tools/file_importer.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState(tasks: [], message: '', status: FormStatus.pure)) {
    on<TasksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
