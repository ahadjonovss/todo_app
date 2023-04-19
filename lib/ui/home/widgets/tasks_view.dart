import '../../../utils/tools/file_importer.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today",style: AppTextStyles.headlineMedium(context),),
          ...List.generate(5, (index) => TaskItem())
        ],
      ),
    );
  }
}
