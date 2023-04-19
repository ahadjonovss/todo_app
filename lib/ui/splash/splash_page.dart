import 'package:todo_app/utils/constants/app_images.dart';
import 'package:todo_app/utils/tools/file_importer.dart';
import 'package:todo_app/utils/tools/mediaquary.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // bool isLog = false;
  //
  // Future<bool> isLoggedIn() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   isLog = pref.getBool("isLoggedIn") ?? false;
  //   return pref.getBool("isLoggedIn") ?? false;
  // }

  @override
  void initState() {
    super.initState();

     goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
          (value) {
        Navigator.pushReplacementNamed(
          // context, isLog ? RouteName.mainPage : RouteName.signIn
            context,RouteName.main
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