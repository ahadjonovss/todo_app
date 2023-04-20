import 'package:todo_app/utils/tools/file_importer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: height(context)*0.02),
          width: width(context),
          height: width(context) / 10,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(categories.length, (index) =>
                  CategoryItem(category: categories[index], isSelected: state
                      .newTask.category == categories[index].title,))
            ],
          ),
        );
      },
    );
  }
}
