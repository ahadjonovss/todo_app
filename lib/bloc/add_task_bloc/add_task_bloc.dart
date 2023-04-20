import 'package:todo_app/utils/tools/file_importer.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState(TaskModel(title: '',id: 0,time: TimeOfDay.now(),category: '',day: DateTime.now()))) {
    on<UpdateTaskEvent>(updateTaskInfo);
    on<AddCurrentTaskEvent>(addTask);
  }

  updateTaskInfo(UpdateTaskEvent event, emit) {
    emit(state.copyWith(taskModel: state.newTask.copyWith(type: event.type,time: event.time,id: event.id,title: event.title)));
  }

  addTask( event, emit){
    getIt<TaskRepository>().addItem(state.newTask);
  }
}
