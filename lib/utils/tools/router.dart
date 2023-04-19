import 'package:todo_app/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';

}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteName.splash:
      //   return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}