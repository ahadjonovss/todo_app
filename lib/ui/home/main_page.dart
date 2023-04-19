import 'package:todo_app/utils/tools/file_importer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      TasksPage()
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: AppColors.cF857C3,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<TabBoxBloc,TabBoxState>(
        builder: (context, state) => pages[state.index],
      ),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
