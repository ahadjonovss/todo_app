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
      body: Column(
        children: [
          CustomAppBar(tasks:context.read<TasksBloc>().state.tasks[0]),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
            children: [
              ...List.generate(categories.length, (index) => CategoryWidget(category: categories[index]))
            ],),)
        ],
      ),
    );
  }
}
