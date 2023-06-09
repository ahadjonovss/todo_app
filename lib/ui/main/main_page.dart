import 'package:todo_app/utils/tools/file_importer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      CategoriesPage()
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: true,
            isScrollControlled: true,
            constraints: BoxConstraints(
              minHeight: height(context)*0.55
            ),
            context: context, builder: (context) => Padding(
              padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskWidget(),
            ));

        },
        backgroundColor: AppColors.cF857C3,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<TabBoxBloc,TabBoxState>(
        builder: (context, state) => pages[state.index],
      ),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
