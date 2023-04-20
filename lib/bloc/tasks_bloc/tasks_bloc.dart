import 'package:todo_app/data/models/my_response.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState(tasks: [], message: '', status: FormStatus.pure)) {
    on<TasksEvent>(getAllTasks);
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
}
