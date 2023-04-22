import 'package:todo_app/utils/tools/file_importer.dart';

class TasksPage extends StatelessWidget {
  List<List<TaskModel>> tasks;
   TasksPage({required this.tasks,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              CustomAppBar(tasks:tasks[0]),
              if(tasks.first.isNotEmpty)
                ...List.generate(tasks.length, (index) => TasksView(tasks: tasks[index],)),
              if(tasks.first.isEmpty)
                SizedBox(
                    height: height(context)*0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: SvgPicture.asset(AppIcons.noTask)),
                        Text("No tasks",style: AppTextStyles.headlineMedium(context),),
                      ],
                    ))


            ],
          ),
        ),
      ),
    );
  }
}
