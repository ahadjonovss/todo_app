import 'package:todo_app/utils/tools/file_importer.dart';

class TasksPage extends StatelessWidget {
  CategoryModel category;
   TasksPage({required this.category,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              CustomAppBar(tasks:category.tasks,title: "You have ${category.tasks.length} tasks for ${category.title}",),
              if(category.tasks.isNotEmpty)
                TasksView(tasks: category.tasks),
              if(category.tasks.isEmpty)
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
