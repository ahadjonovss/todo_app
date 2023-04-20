import 'package:todo_app/utils/tools/file_importer.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState(TaskModel(title: '',id: 0,time: DateTime.now(),category: ''))) {
    on<UpdateTaskEvent>(updateTaskInfo);
  }

  updateTaskInfo(UpdateTaskEvent event, emit) {
    emit(state.copyWith(taskModel: state.newTask.copyWith(type: event.type,time: event.time,id: event.id,title: event.title)));
  }
}
