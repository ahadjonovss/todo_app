import 'package:todo_app/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const main = 'main';

}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.main:
        return MaterialPageRoute(builder: (_) =>  MainPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}