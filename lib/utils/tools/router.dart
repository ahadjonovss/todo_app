import 'package:todo_app/ui/main/pages/categories/sub_screens/tasks_page.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const main = 'main';
  static const onBoarding = 'onBoarding';
  static const tasks = 'tasks';

}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.tasks:
        return MaterialPageRoute(builder: (_) =>  TasksPage(tasks: [arguments as List<TaskModel>]));
      case RouteName.main:
        return MaterialPageRoute(builder: (_) =>  MainPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) =>  OnBoardingPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}