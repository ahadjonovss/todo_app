
import 'package:todo_app/ui/home/widgets/tasks_view.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          children:   [
            const CustomAppBar(),
            TasksView()


      ],
    ),
    ),
    );
  }
}
