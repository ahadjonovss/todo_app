import 'package:todo_app/utils/tools/file_importer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
     goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
          (value) {
        Navigator.pushReplacementNamed(
          context, getIt<SplashRepository>().isLoggedIn()==true ? RouteName.main : RouteName.onBoarding
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset(AppImages.appLogo,width: width(context)*0.5,),
            ],
          ),
        ),
      ),
    );
  }
}