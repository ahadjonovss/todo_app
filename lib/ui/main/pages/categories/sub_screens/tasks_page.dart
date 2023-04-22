import 'package:todo_app/utils/tools/file_importer.dart';

class TasksPage extends StatelessWidget {
  int index;
  TasksPage({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return SizedBox(
            height: height(context),
            width: width(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    tasks: state.categories[index].tasks,
                    title:
                        "You have ${state.categories[index].tasks.length} tasks for ${state.categories[index].title}",
                  ),
                  if (state.categories[index].tasks.isNotEmpty)
                    TasksView(tasks: state.categories[index].tasks),
                  if (state.categories[index].tasks.isEmpty)
                    SizedBox(
                        height: height(context) * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: SvgPicture.asset(AppIcons.noTask)),
                            Text(
                              "No tasks",
                              style: AppTextStyles.headlineMedium(context),
                            ),
                          ],
                        ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
