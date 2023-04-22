import 'package:intl/intl.dart';

import '../../../utils/tools/file_importer.dart';

class TasksView extends StatelessWidget {
  List<TaskModel> tasks;
   TasksView({required this.tasks,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty?Container(
      width: width(context),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(getDay(tasks[0].boxName),style: AppTextStyles.headlineMedium(context),),
          ...List.generate(tasks.length, (index) => TaskItem(task: tasks[index],))
        ],
      ),
    ):SizedBox();
  }
}
