import 'package:todo_app/utils/tools/file_importer.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState(

      TaskModel(title: '',id: 0,
      isFinished: false,
      mustNotify: true,
      boxName: DateTime.now().toString().split(' ').first,
      time: TimeOfDay.now(),
      category: '',day: DateTime.now()),
    status: FormStatus.pure
  )
  ) {
    on<UpdateTaskInformationEvent>(updateTaskInfo);
    on<AddCurrentTaskEvent>(addTask);
  }

  updateTaskInfo(UpdateTaskInformationEvent event, emit) {
    emit(state.copyWith(taskModel: state.newTask.copyWith(type: event.type,time: event.time,id: event.id,title: event.title)));
  }

  addTask( event, emit){
    if(state.newTask.title.isNotEmpty && state.newTask.time!=TimeOfDay.now() && state.newTask.category.isNotEmpty ){
      getIt<TaskRepository>().addItem(state.newTask);
      emit(state.copyWith(status: FormStatus.success));
    }else{
      emit(state.copyWith(status: FormStatus.fail));
      emit(state.copyWith(status: FormStatus.pure));
    }
  }
}
