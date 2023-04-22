import 'package:todo_app/utils/tools/file_importer.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(tasks:context.read<TasksBloc>().state.tasks[0]),
        ],
      ),
    );
  }
}
