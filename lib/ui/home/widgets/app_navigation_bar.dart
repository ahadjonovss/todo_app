import 'package:bookmeri/utils/tools/file_importer.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBoxBloc,TabBoxState>(
      builder: (context, state) => BottomNavigationBar(
        currentIndex: state.index,
          selectedItemColor: AdaptiveTheme.of(context).theme.primaryColor,
          unselectedItemColor:AdaptiveTheme.of(context).theme.indicatorColor ,
          onTap: (value) {
            context.read<TabBoxBloc>().add(ChangeIndexEvent(value));
          },

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.book),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.menu),label: ""),
          ]),
    );
  }
}
