import 'package:todo_app/utils/tools/file_importer.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState(tasks: [], message: '', status: FormStatus.pure)) {
    on<GetAllTasks>(getAllTasks);
    on<UpdateCurrentTaskEvent>(updateTask);
    on<DeleteTaskEvent>(deleteTask);
  }


  getAllTasks(event, emit) {
   emit(state.copyWith(status: FormStatus.getting));
   MyResponse myResponse = getIt<TaskRepository>().getItems();
   if(myResponse.errorMessage.isEmpty){
     emit(state.copyWith(status: FormStatus.success,tasks: myResponse.tasks));
   }else{
     emit(state.copyWith(status: FormStatus.fail,message: myResponse.errorMessage));
   }
  }


  updateTask(UpdateCurrentTaskEvent event,emit){
    getIt<TaskRepository>().updateItem(event.task);
    if(event.task.mustNotify){
      getIt<TaskRepository>().setNotification(event.task);
    }else{
      getIt<TaskRepository>().cancelNotification(event.task.id);
    }
    emit(state.copyWith(status: FormStatus.updated));
    add(GetAllTasks());
  }


  deleteTask(DeleteTaskEvent event, emit) {
    getIt<TaskRepository>().deleteItem(event.id);
    emit(state.copyWith(status: FormStatus.updated));
    add(GetAllTasks());
  }
}
