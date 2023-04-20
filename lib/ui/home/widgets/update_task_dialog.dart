import 'package:flutter/cupertino.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class UpdateTaskDialog extends StatelessWidget {
  TaskModel task;
  UpdateTaskDialog({required this.task,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocListener<TasksBloc, TasksState>(
      listener: (context, state) {
        if(state.status==FormStatus.updated){
          Navigator.pop(context);
        }
      },
      child: CupertinoAlertDialog(
        title: const Text("Have you finished this task?"),
        content: Text(task.title),
        actions: [
          CupertinoDialogAction(
            child: const Text("No"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text("Yes"),
            onPressed: () {
              context.read<TasksBloc>().add(UpdateCurrentTaskEvent(task.copyWith(isFinished: true)));
            },
          ),

        ],
      ),
    );
  }
}
