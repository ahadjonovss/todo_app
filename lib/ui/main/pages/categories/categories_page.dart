import 'package:todo_app/ui/main/pages/categories/widgets/category_widget.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return ListView(
            children: [
              CustomAppBar(tasks: context
                  .read<TasksBloc>()
                  .state
                  .tasks[0]),
              Padding(
                padding: EdgeInsets.all(height(context) * 0.02),
                child: Text(
                  "Projects",
                  style: AppTextStyles.headlineMedium(context),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      ...List.generate(
                        categories.length,
                            (index) =>
                            CategoryWidget(category: categories[index]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
