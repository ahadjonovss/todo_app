import 'package:flutter/cupertino.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class CustomDialog extends StatelessWidget {
  String title;
  String task;
  VoidCallback onYesTapped;

  CustomDialog({required this.title,required this.onYesTapped,required this.task,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocListener<TasksBloc, TasksState>(
      listener: (context, state) {
        if(state.status==FormStatus.updated){
          Navigator.pop(context);
        }
      },
      child: CupertinoAlertDialog(
        title:  Text(title),
        content: Text(task),
        actions: [
          CupertinoDialogAction(
            child: const Text("No"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            onPressed: onYesTapped,
            child:  const Text("Yes"),
          ),

        ],
      ),
    );
  }
}
