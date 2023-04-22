import 'package:todo_app/utils/tools/file_importer.dart';

class CategoriesView extends StatelessWidget {
  bool isUpdate;
  dynamic state;
  CategoriesView({required this.state,required this.isUpdate,  Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height(context) * 0.02),
      width: width(context),
      height: width(context) / 10,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(
              categories.length,
                  (index) => CategoryItem(
                category: categories[index],
                isSelected:
                state.newTask.category == categories[index].title,
                onTap: () {
                  if (isUpdate) {
                    context.read<UpdateTaskBloc>()
                        .add(UpdateTaskInfoEvent(type: categories[index].title));
                  } else {
                    context.read<AddTaskBloc>().add(UpdateTaskInformationEvent(type: categories[index].title));
                  }
                },
              ))
        ],
      ),
    );
  }
}
