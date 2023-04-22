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
                    CustomAppBar(tasks:state.tasks[0]),
                   ...List.generate(state.tasks.length, (index) => TasksView(tasks: state.tasks[index],))


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
