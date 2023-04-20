import 'package:todo_app/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:todo_app/ui/home/widgets/tasks_view.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
         if(state.status==FormStatus.success){
           return SizedBox(
             height: height(context),
             width: width(context),
             child: SingleChildScrollView(
               child: Column(
                 children:  [
                   CustomAppBar(),
                   TasksView(tasks: state.tasks,)


                 ],
               ),
             ),
           );
         }
         else{
           return const CircularProgressIndicator();
         }
        },
      ),
    );
  }
}
