import 'package:todo_app/ui/main/pages/categories/widgets/category_widget.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: height(context),
              width: width(context),
              child: Wrap(
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
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 2,
                    children: [
                      ...List.generate(
                        state.categories.length,
                            (index) =>
                            CategoryWidget(category: state.categories[index]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
