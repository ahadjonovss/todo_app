import 'dart:async';
import 'package:todo_app/utils/tools/file_importer.dart';

part 'update_task_event.dart';
part 'update_task_state.dart';

class UpdateTaskBloc extends Bloc<UpdateTaskEvent, UpdateTaskState> {
  UpdateTaskBloc() : super(UpdateTaskState(TaskModel(title: '',id: 0,
      isFinished: false,
      mustNotify: true,
      boxName: DateTime.now().toString().split(' ').first,
      time: TimeOfDay.now(),
      category: '',day: DateTime.now()))) {
    on<UpdateTaskInfoEvent>(updateTaskInfo);
    on<UpdateInfoOfCurrentTaskEvent>(updateTask);
  }


  updateTaskInfo(UpdateTaskInfoEvent event, emit) {
    emit(state.copyWith(taskModel: state.newTask.copyWith(type: event.type,time: event.time,id: event.id,title: event.title)));
  }

  updateTask( event, emit){
    getIt<TaskRepository>().updateItem(event.item);
  }
}
