import 'package:todo_app/ui/onboarding/onboarding_page.dart';
import 'package:todo_app/utils/tools/file_importer.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const main = 'main';
  static const onBoarding = 'onBoarding';

}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.main:
        return MaterialPageRoute(builder: (_) =>  MainPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) =>  OnBoardingPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}