import 'package:todo_app/utils/tools/file_importer.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBoxBloc,TabBoxState>(
      builder: (context, state) => BottomNavigationBar(
        elevation: 0,
        currentIndex: state.index,
          selectedItemColor: Colors.blue,
          unselectedItemColor:Colors.grey ,
          onTap: (value) {
            context.read<TabBoxBloc>().add(ChangeIndexEvent(value));
          },

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.task),label: ""),
          ]),
    );
  }
}
