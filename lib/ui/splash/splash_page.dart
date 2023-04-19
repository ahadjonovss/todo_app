import 'package:todo_app/utils/tools/file_importer.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              //Text("Bookmeri",style: TextStyle(fontFamily:"Inter",fontSize: 36.sp, fontWeight: FontWeight.w600, color: AppColors.cWhite),),

            ],
          ),
        ),
      ),
    );
  }
}